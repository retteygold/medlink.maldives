type SymptomCheckResponse = {
  summary: string
  possibleConditions: string[]
  commonSymptoms: string[]
  redFlags: string[]
  selfCare: string[]
  firstAid: string[]
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

export default async function handler(req: ApiRequest, res: ApiResponse) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const apiKey = process.env.OPENAI_API_KEY
  if (!apiKey) {
    return res.status(500).json({ error: 'Missing OPENAI_API_KEY' })
  }

  const symptoms = typeof req.body?.symptoms === 'string' ? req.body.symptoms.trim() : ''
  if (!symptoms) {
    return res.status(400).json({ error: 'Missing symptoms' })
  }

  const system =
    'You are a careful medical triage assistant. You do NOT diagnose. Provide general educational information and safe self-care. Always include red flags for emergencies. Output ONLY valid JSON matching the schema.'

  const user = {
    schema: {
      summary: 'string (1-2 sentences)',
      possibleConditions: 'string[] (max 7, no scary certainty)',
      commonSymptoms: 'string[] (max 8)',
      redFlags: 'string[] (max 8, include emergency warning signs)',
      selfCare: 'string[] (max 8, safe home care)',
      firstAid: 'string[] (max 6, safe general steps)',
      exercises: 'string[] (max 6, safe general suggestions if appropriate; otherwise empty)',
      recommendedSpecialties: 'string[] (max 5, use common specialties like General Medicine, Cardiology, Neurology, Pediatrics, Orthopedics, ENT, Dermatology, Gastroenterology, Gynecology, Ophthalmology, Dental)',
      urgency: 'one of: low, medium, high, emergency'
    },
    symptoms
  }

  const payload = {
    model: 'gpt-4o-mini',
    temperature: 0.2,
    messages: [
      { role: 'system', content: system },
      { role: 'user', content: JSON.stringify(user) }
    ]
  }

  const response = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${apiKey}`
    },
    body: JSON.stringify(payload)
  })

  if (!response.ok) {
    const text = await response.text()
    return res.status(502).json({ error: 'OpenAI request failed', detail: text })
  }

  const data = (await response.json()) as any
  const content = data?.choices?.[0]?.message?.content
  if (typeof content !== 'string') {
    return res.status(502).json({ error: 'Invalid OpenAI response' })
  }

  const parsed = safeJsonParse<Partial<SymptomCheckResponse>>(content)
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
    exercises: normalizeArray(parsed.exercises),
    recommendedSpecialties: normalizeArray(parsed.recommendedSpecialties),
    urgency: clampUrgency(parsed.urgency)
  }

  return res.status(200).json(result)
}
