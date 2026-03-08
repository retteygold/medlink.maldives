type SymptomCheckResponse = {
  summary: string
  possibleConditions: string[]
  commonSymptoms: string[]
  redFlags: string[]
  selfCare: string[]
  firstAid: string[]
  avoidList: string[]
  exercises: string[]
  recommendedSpecialties: string[]
  urgency: 'low' | 'medium' | 'high' | 'emergency'
}

type ApiRequest = {
  method?: string
  body?: any
}

type ApiResponse = {
  status: (code: number) => ApiResponse
  json: (data: any) => any
  setHeader: (name: string, value: string) => void
}

function safeJsonParse<T>(value: string): T | null {
  try {
    return JSON.parse(value) as T
  } catch {
    return null
  }
}

function extractFirstJsonObject(value: string): string | null {
  const trimmed = value.trim()
  const withoutFences = trimmed
    .replace(/^```(json)?/i, '')
    .replace(/```$/i, '')
    .trim()

  const start = withoutFences.indexOf('{')
  const end = withoutFences.lastIndexOf('}')
  if (start === -1 || end === -1 || end <= start) return null
  return withoutFences.slice(start, end + 1)
}

function normalizeArray(value: unknown): string[] {
  if (!Array.isArray(value)) return []
  return value
    .map(v => (typeof v === 'string' ? v.trim() : ''))
    .filter(Boolean)
    .slice(0, 12)
}

function clampUrgency(value: unknown): SymptomCheckResponse['urgency'] {
  const v = typeof value === 'string' ? value.toLowerCase().trim() : ''
  if (v === 'emergency' || v === 'high' || v === 'medium' || v === 'low') return v
  return 'medium'
}

function fallbackList(items: string[], fallback: string[]): string[] {
  return items.length ? items : fallback
}

function buildSymptomBasedFallback(symptoms: string) {
  const s = symptoms.toLowerCase()

  if (s.includes('chest') || s.includes('shortness of breath') || s.includes('breath') || s.includes('pressure')) {
    return {
      selfCare: [
        'Stop exertion and rest in a comfortable position.',
        'Avoid driving yourself if you feel unwell; ask someone to assist you.',
        'If symptoms are mild but persistent, arrange urgent medical evaluation.'
      ],
      firstAid: [
        'If chest pain is severe, lasts more than a few minutes, or comes with sweating/nausea/fainting, call emergency services immediately.',
        'If breathing is difficult, sit upright and seek emergency care now.'
      ],
      avoidList: [
        'Avoid strenuous activity.',
        'Avoid smoking or vaping.',
        'Avoid delaying care if symptoms are new, severe, or worsening.'
      ],
      exercises: [] as string[]
    }
  }

  if (s.includes('fever') || s.includes('cough') || s.includes('sore throat') || s.includes('runny') || s.includes('running nose') || s.includes('sneez')) {
    return {
      selfCare: [
        'Drink warm fluids and rest.',
        'Use saline spray or steam inhalation for a blocked/runny nose.',
        'Gargle warm salt water for sore throat (if appropriate).'
      ],
      firstAid: [
        'Seek urgent care if you have trouble breathing, chest pain, blue lips, confusion, or severe weakness.',
        'Seek care if fever is very high or lasts more than 3 days, or if you are pregnant/elderly/immune-compromised.'
      ],
      avoidList: [
        'Avoid dehydration (do not skip fluids).',
        'Avoid smoking and secondhand smoke.',
        'Avoid antibiotics unless prescribed by a clinician.'
      ],
      exercises: [
        'Light walking and gentle stretching only if you feel stable; rest if symptoms worsen.'
      ]
    }
  }

  if (s.includes('diarr') || s.includes('vomit') || s.includes('nausea') || s.includes('stomach') || s.includes('abdomen')) {
    return {
      selfCare: [
        'Sip oral rehydration solution (ORS) or clear fluids frequently.',
        'Eat bland foods (rice/banana/toast) if tolerated.',
        'Rest and monitor urine output (dehydration warning sign).'
      ],
      firstAid: [
        'Seek urgent care if there is blood in stool/vomit, severe abdominal pain, fainting, or signs of dehydration.',
        'Seek care if symptoms persist beyond 24–48 hours or you cannot keep fluids down.'
      ],
      avoidList: [
        'Avoid alcohol, very spicy foods, and high-fat foods.',
        'Avoid unclean water or street food while recovering.',
        'Avoid anti-diarrheal medicine if there is fever or blood in stool unless a clinician advises.'
      ],
      exercises: [] as string[]
    }
  }

  if (s.includes('headache') || s.includes('migraine')) {
    return {
      selfCare: [
        'Hydrate and rest in a dark, quiet room.',
        'Use a cold or warm compress on the forehead/neck.',
        'Track triggers like sleep loss, dehydration, or skipped meals.'
      ],
      firstAid: [
        'Seek urgent care if headache is sudden and severe, with weakness, confusion, fainting, stiff neck, or vision changes.',
        'Seek care if headache is worsening over days or after a head injury.'
      ],
      avoidList: [
        'Avoid dehydration and skipping meals.',
        'Avoid excessive caffeine and alcohol.',
        'Avoid overusing pain medicines (can worsen headaches).' 
      ],
      exercises: [
        'Gentle neck/shoulder stretches and posture breaks if it feels like tension headache.'
      ]
    }
  }

  return {
    selfCare: [
      'Drink fluids and rest.',
      'Monitor symptoms and seek care if worsening.',
      'Use simple foods if stomach upset (if tolerated).'
    ],
    firstAid: [
      'If severe symptoms develop (trouble breathing, chest pain, fainting), seek emergency care.',
      'If high fever or dehydration signs occur, get urgent medical help.'
    ],
    avoidList: [
      'Avoid alcohol and smoking.',
      'Avoid strenuous exercise if you feel weak, dizzy, or short of breath.',
      'Avoid self-medicating with antibiotics unless prescribed.'
    ],
    exercises: [] as string[]
  }
}

export default async function handler(req: ApiRequest, res: ApiResponse) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const apiKey = process.env.GROQ_API_KEY
  if (!apiKey) {
    return res.status(500).json({ error: 'Missing GROQ_API_KEY' })
  }

  const symptoms = typeof req.body?.symptoms === 'string' ? req.body.symptoms.trim() : ''
  if (!symptoms) {
    return res.status(400).json({ error: 'Missing symptoms' })
  }

  const system =
    'You are a careful medical triage assistant. You do NOT diagnose. Provide general educational information and safe self-care. Always include red flags for emergencies. Always include: selfCare, firstAid, avoidList. Exercises can be empty if not appropriate. Output ONLY valid JSON matching the schema.'

  const user = {
    schema: {
      summary: 'string (1-2 sentences)',
      possibleConditions: 'string[] (max 7, no scary certainty)',
      commonSymptoms: 'string[] (max 8)',
      redFlags: 'string[] (max 8, include emergency warning signs)',
      selfCare: 'string[] (max 8, safe home care)',
      firstAid: 'string[] (max 6, safe general steps)',
      avoidList: 'string[] (max 8, what to avoid / what can worsen symptoms / safety warnings)',
      exercises: 'string[] (max 6, safe general suggestions if appropriate; otherwise empty)',
      recommendedSpecialties: 'string[] (max 5, use common specialties like General Medicine, Cardiology, Neurology, Pediatrics, Orthopedics, ENT, Dermatology, Gastroenterology, Gynecology, Ophthalmology, Dental)',
      urgency: 'one of: low, medium, high, emergency'
    },
    symptoms
  }

  const payload = {
    model: 'llama-3.1-8b-instant',
    temperature: 0.2,
    messages: [
      { role: 'system', content: system },
      { role: 'user', content: JSON.stringify(user) }
    ]
  }

  const response = await fetch('https://api.groq.com/openai/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${apiKey}`
    },
    body: JSON.stringify(payload)
  })

  if (!response.ok) {
    const text = await response.text()
    return res.status(502).json({ error: 'Groq request failed', detail: text })
  }

  const data = (await response.json()) as any
  const content = data?.choices?.[0]?.message?.content
  if (typeof content !== 'string' || !content.trim()) {
    return res.status(502).json({ error: 'Invalid Groq response' })
  }

  const jsonCandidate = extractFirstJsonObject(content) ?? content
  const parsed = safeJsonParse<Partial<SymptomCheckResponse>>(jsonCandidate)
  if (!parsed) {
    return res.status(502).json({ error: 'Model did not return valid JSON', raw: content })
  }

  const result: SymptomCheckResponse = {
    summary: typeof parsed.summary === 'string' ? parsed.summary.trim().slice(0, 300) : '',
    possibleConditions: normalizeArray(parsed.possibleConditions),
    commonSymptoms: normalizeArray(parsed.commonSymptoms),
    redFlags: normalizeArray(parsed.redFlags),
    selfCare: normalizeArray(parsed.selfCare),
    firstAid: normalizeArray(parsed.firstAid),
    avoidList: normalizeArray((parsed as any).avoidList),
    exercises: normalizeArray(parsed.exercises),
    recommendedSpecialties: normalizeArray(parsed.recommendedSpecialties),
    urgency: clampUrgency(parsed.urgency)
  }

  const symptomFallback = buildSymptomBasedFallback(symptoms)
  result.summary = result.summary || 'General guidance based on your symptoms. For a proper diagnosis and treatment plan, consult a licensed clinician.'
  result.selfCare = fallbackList(result.selfCare, symptomFallback.selfCare)
  result.firstAid = fallbackList(result.firstAid, symptomFallback.firstAid)
  result.avoidList = fallbackList(result.avoidList, symptomFallback.avoidList)
  result.exercises = fallbackList(result.exercises, symptomFallback.exercises)

  return res.status(200).json(result)
}
