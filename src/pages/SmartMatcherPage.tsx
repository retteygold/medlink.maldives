import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Sparkles, MapPin, Star, AlertTriangle } from 'lucide-react'
import type { Doctor } from '../types'
import { getDoctors } from '../lib/dataService'

const symptomKeywords: Record<string, { specialties: string[]; urgency: string; description: string }> = {
  'chest pain': { specialties: ['Cardiology'], urgency: 'emergency', description: 'Chest pain requires immediate cardiac evaluation' },
  'headache': { specialties: ['Neurology', 'General Medicine'], urgency: 'medium', description: 'Persistent headaches may need neurological evaluation' },
  'fever': { specialties: ['General Medicine', 'Pediatrics'], urgency: 'medium', description: 'General physicians can evaluate fever causes' },
  'eye': { specialties: ['Ophthalmology'], urgency: 'medium', description: 'Eye conditions need ophthalmological care' },
  'bone': { specialties: ['Orthopedics'], urgency: 'medium', description: 'Bone and joint issues need orthopedic care' },
  'skin': { specialties: ['Dermatology'], urgency: 'low', description: 'Skin conditions are treated by dermatologists' },
  'tooth': { specialties: ['Dental'], urgency: 'medium', description: 'Dental issues need dentist evaluation' },
  'child': { specialties: ['Pediatrics'], urgency: 'medium', description: 'Children should see a pediatric specialist' },
}

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

type PatientContext = {
  age?: number
  sex?: 'male' | 'female' | 'other' | 'prefer_not_to_say'
  durationDays?: number
  severity?: 'mild' | 'moderate' | 'severe'
  pregnant?: boolean
  conditions?: string
  redFlags?: {
    troubleBreathing?: boolean
    chestPain?: boolean
    fainting?: boolean
    confusion?: boolean
    weaknessOneSide?: boolean
    severeBleeding?: boolean
  }
}

export default function SmartMatcherPage() {
  const navigate = useNavigate()
  const [symptoms, setSymptoms] = useState('')
  const [symptomDraft, setSymptomDraft] = useState('')
  const [selectedSymptoms, setSelectedSymptoms] = useState<string[]>([])
  const [showDetails, setShowDetails] = useState(false)
  const [age, setAge] = useState<number | ''>('')
  const [sex, setSex] = useState<PatientContext['sex']>('prefer_not_to_say')
  const [durationDays, setDurationDays] = useState<number | ''>('')
  const [severity, setSeverity] = useState<PatientContext['severity']>('moderate')
  const [pregnant, setPregnant] = useState(false)
  const [conditions, setConditions] = useState('')
  const [rfTroubleBreathing, setRfTroubleBreathing] = useState(false)
  const [rfChestPain, setRfChestPain] = useState(false)
  const [rfFainting, setRfFainting] = useState(false)
  const [rfConfusion, setRfConfusion] = useState(false)
  const [rfWeaknessOneSide, setRfWeaknessOneSide] = useState(false)
  const [rfSevereBleeding, setRfSevereBleeding] = useState(false)
  const [isAnalyzing, setIsAnalyzing] = useState(false)
  const [analysis, setAnalysis] = useState<SymptomCheckResponse | null>(null)
  const [recommendedDoctors, setRecommendedDoctors] = useState<Doctor[]>([])
  const [error, setError] = useState<string | null>(null)

  const commonSymptomOptions = [
    'Running nose',
    'Sneezing',
    'Sore throat',
    'Cough',
    'Fever',
    'Headache',
    'Body aches',
    'Fatigue',
    'Nausea',
    'Vomiting',
    'Diarrhea',
    'Stomach pain',
    'Chest pain',
    'Shortness of breath',
    'Dizziness',
    'Back pain',
    'Joint pain',
    'Tooth pain',
    'Eye pain',
    'Skin rash'
  ]

  const syncSymptomsText = (nextSelected: string[]) => {
    const trimmed = symptoms.trim()
    const next = nextSelected.length ? nextSelected.join(', ') : ''
    if (!trimmed || trimmed === selectedSymptoms.join(', ')) {
      setSymptoms(next)
    }
  }

  const addSymptomFromDraft = () => {
    const s = symptomDraft.trim()
    if (!s) return

    const exists = selectedSymptoms.some(x => x.toLowerCase().trim() === s.toLowerCase())
    const nextSelected = exists ? selectedSymptoms : [...selectedSymptoms, s]
    setSelectedSymptoms(nextSelected)
    setSymptomDraft('')
    syncSymptomsText(nextSelected)
  }

  const removeSelectedSymptom = (value: string) => {
    const nextSelected = selectedSymptoms.filter(s => s !== value)
    setSelectedSymptoms(nextSelected)
    syncSymptomsText(nextSelected)
  }

  const analyzeSymptoms = async () => {
    const input = symptoms.trim()
    if (!input) return

    const context: PatientContext = {
      age: typeof age === 'number' ? age : undefined,
      sex,
      durationDays: typeof durationDays === 'number' ? durationDays : undefined,
      severity,
      pregnant: pregnant ? true : undefined,
      conditions: conditions.trim() ? conditions.trim() : undefined,
      redFlags: {
        troubleBreathing: rfTroubleBreathing,
        chestPain: rfChestPain,
        fainting: rfFainting,
        confusion: rfConfusion,
        weaknessOneSide: rfWeaknessOneSide,
        severeBleeding: rfSevereBleeding
      }
    }

    setIsAnalyzing(true)
    setError(null)
    setAnalysis(null)
    setRecommendedDoctors([])

    try {
      const resp = await fetch('/api/symptom-check', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ symptoms: input, context })
      })

      if (!resp.ok) {
        const msg = await resp.text()
        throw new Error(msg || 'Failed to analyze symptoms')
      }

      const data = (await resp.json()) as SymptomCheckResponse
      setAnalysis(data)

      const doctors = await getDoctors()
      const specialtySet = new Set((data.recommendedSpecialties || []).map(s => s.toLowerCase().trim()).filter(Boolean))

      const matched = specialtySet.size
        ? doctors.filter(d => specialtySet.has((d.specialty || '').toLowerCase().trim()))
        : doctors

      const sorted = [...matched].sort((a, b) => (b.rating || 0) - (a.rating || 0))
      setRecommendedDoctors(sorted.slice(0, 10))
    } catch {
      const symptomLower = input.toLowerCase()
      const matchedSpecs = new Set<string>()
      let maxUrgency: SymptomCheckResponse['urgency'] = 'medium'
      const descriptions: string[] = []

      Object.entries(symptomKeywords).forEach(([keyword, data]) => {
        if (symptomLower.includes(keyword)) {
          data.specialties.forEach(spec => matchedSpecs.add(spec))
          descriptions.push(data.description)
          if (data.urgency === 'emergency') maxUrgency = 'emergency'
          else if (data.urgency === 'high' && maxUrgency !== 'emergency') maxUrgency = 'high'
          else if (data.urgency === 'low' && maxUrgency !== 'emergency' && maxUrgency !== 'high') maxUrgency = 'low'
        }
      })

      const fallback: SymptomCheckResponse = {
        summary: descriptions[0] || 'Based on your symptoms, we recommend consulting a doctor for proper evaluation.',
        possibleConditions: [],
        commonSymptoms: [],
        redFlags: ['If symptoms are severe, worsening, or you have trouble breathing / chest pain / fainting, seek emergency care.'],
        selfCare: [],
        firstAid: [],
        avoidList: ['Avoid alcohol and smoking. If symptoms worsen or you develop red flags, seek urgent care.'],
        exercises: [],
        recommendedSpecialties: Array.from(matchedSpecs),
        urgency: maxUrgency
      }

      setError('AI service is temporarily unavailable. Showing basic recommendations.')
      setAnalysis(fallback)

      const doctors = await getDoctors()
      const specialtySet = new Set(fallback.recommendedSpecialties.map(s => s.toLowerCase().trim()).filter(Boolean))
      const matched = specialtySet.size
        ? doctors.filter(d => specialtySet.has((d.specialty || '').toLowerCase().trim()))
        : doctors
      const sorted = [...matched].sort((a, b) => (b.rating || 0) - (a.rating || 0))
      setRecommendedDoctors(sorted.slice(0, 10))
    } finally {
      setIsAnalyzing(false)
    }
  }

  const getUrgencyColor = (urgency: string) => {
    switch (urgency) {
      case 'emergency': return 'bg-red-500 text-white'
      case 'high': return 'bg-orange-500 text-white'
      case 'medium': return 'bg-yellow-500 text-white'
      default: return 'bg-green-500 text-white'
    }
  }

  function Section({ title, items }: { title: string; items: string[] }) {
    if (!items || items.length === 0) return null
    return (
      <div className="card p-4">
        <h3 className="font-bold text-gray-800 mb-2">{title}</h3>
        <div className="space-y-2">
          {items.map((it, idx) => (
            <div key={idx} className="text-sm text-gray-600">• {it}</div>
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="gradient-header px-4 pt-12 pb-6">
        <div className="flex items-center justify-between mb-2">
          <button
            type="button"
            onClick={() => (window.history.length > 1 ? navigate(-1) : navigate('/'))}
            className="text-white/80"
          >
            ← Back
          </button>
          <button
            type="button"
            onClick={() => navigate('/')}
            className="text-white/80"
          >
            Home
          </button>
        </div>
        <div className="flex items-center gap-4 mb-4">
          <img src="/images/logo.png" alt="MedLink" className="w-12 h-12 rounded-xl" />
          <div>
            <h1 className="text-xl font-bold text-white">Smart Doctor Finder</h1>
            <p className="text-white/80 text-sm">Describe your symptoms and we'll find the right specialist</p>
          </div>
        </div>
        <div className="flex justify-center">
          <img 
            src="/images/storyset/Online Doctor-pana.svg" 
            alt="Online Doctor" 
            className="w-40 h-40 object-contain drop-shadow-lg"
          />
        </div>
      </div>

      <div className="px-4 -mt-3">
        <div className="card p-4">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            What symptoms are you experiencing?
          </label>
          <div className="flex gap-2 mb-3">
            <div className="flex-1">
              <input
                value={symptomDraft}
                onChange={(e) => setSymptomDraft(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === 'Enter') {
                    e.preventDefault()
                    addSymptomFromDraft()
                  }
                }}
                list="symptom-options"
                placeholder="Select a symptom (dropdown)"
                className="input-field"
              />
              <datalist id="symptom-options">
                {commonSymptomOptions.map((opt) => (
                  <option key={opt} value={opt} />
                ))}
              </datalist>
            </div>
            <button
              type="button"
              onClick={addSymptomFromDraft}
              className="px-4 py-2 rounded-xl bg-gray-900 text-white text-sm font-semibold"
            >
              Add
            </button>
          </div>

          {selectedSymptoms.length > 0 && (
            <div className="flex flex-wrap gap-2 mb-3">
              {selectedSymptoms.map((s) => (
                <button
                  key={s}
                  type="button"
                  onClick={() => removeSelectedSymptom(s)}
                  className="px-3 py-1 rounded-full bg-medical-50 text-medical-700 text-xs font-semibold border border-medical-100"
                  title="Click to remove"
                >
                  {s} ×
                </button>
              ))}
            </div>
          )}

          <textarea
            value={symptoms}
            onChange={(e) => setSymptoms(e.target.value)}
            placeholder="Example: I've been having chest pain and shortness of breath..."
            className="input-field min-h-[120px] resize-none"
          />

          <button
            type="button"
            onClick={() => setShowDetails(v => !v)}
            className="w-full mt-3 px-4 py-2 rounded-xl bg-gray-100 text-gray-800 text-sm font-semibold"
          >
            {showDetails ? 'Hide details' : 'Add details (improves accuracy)'}
          </button>

          {showDetails && (
            <div className="mt-3 space-y-3">
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <div className="text-xs font-semibold text-gray-600 mb-1">Age</div>
                  <input
                    value={age}
                    onChange={(e) => {
                      const v = e.target.value
                      setAge(v === '' ? '' : Number(v))
                    }}
                    inputMode="numeric"
                    type="number"
                    min={0}
                    max={120}
                    className="input-field"
                    placeholder="e.g. 25"
                  />
                </div>
                <div>
                  <div className="text-xs font-semibold text-gray-600 mb-1">Sex</div>
                  <select value={sex} onChange={(e) => setSex(e.target.value as PatientContext['sex'])} className="input-field">
                    <option value="prefer_not_to_say">Prefer not to say</option>
                    <option value="female">Female</option>
                    <option value="male">Male</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <div>
                  <div className="text-xs font-semibold text-gray-600 mb-1">Duration (days)</div>
                  <input
                    value={durationDays}
                    onChange={(e) => {
                      const v = e.target.value
                      setDurationDays(v === '' ? '' : Number(v))
                    }}
                    inputMode="numeric"
                    type="number"
                    min={0}
                    max={365}
                    className="input-field"
                    placeholder="e.g. 3"
                  />
                </div>
                <div>
                  <div className="text-xs font-semibold text-gray-600 mb-1">Severity</div>
                  <select value={severity} onChange={(e) => setSeverity(e.target.value as PatientContext['severity'])} className="input-field">
                    <option value="mild">Mild</option>
                    <option value="moderate">Moderate</option>
                    <option value="severe">Severe</option>
                  </select>
                </div>
              </div>

              <div className="flex items-center justify-between gap-3 rounded-xl bg-gray-50 border border-gray-200 px-3 py-2">
                <div className="text-sm font-semibold text-gray-700">Pregnant</div>
                <input type="checkbox" checked={pregnant} onChange={(e) => setPregnant(e.target.checked)} />
              </div>

              <div>
                <div className="text-xs font-semibold text-gray-600 mb-1">Existing conditions (optional)</div>
                <input
                  value={conditions}
                  onChange={(e) => setConditions(e.target.value)}
                  className="input-field"
                  placeholder="e.g. asthma, diabetes"
                />
              </div>

              <div className="rounded-xl bg-red-50 border border-red-200 p-3">
                <div className="text-sm font-bold text-red-800 mb-2">Emergency warning signs</div>
                <div className="space-y-2 text-sm text-red-800">
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfTroubleBreathing} onChange={(e) => setRfTroubleBreathing(e.target.checked)} />
                    Trouble breathing
                  </label>
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfChestPain} onChange={(e) => setRfChestPain(e.target.checked)} />
                    Chest pain
                  </label>
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfFainting} onChange={(e) => setRfFainting(e.target.checked)} />
                    Fainting
                  </label>
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfConfusion} onChange={(e) => setRfConfusion(e.target.checked)} />
                    Confusion
                  </label>
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfWeaknessOneSide} onChange={(e) => setRfWeaknessOneSide(e.target.checked)} />
                    Weakness/numbness on one side
                  </label>
                  <label className="flex items-center gap-2">
                    <input type="checkbox" checked={rfSevereBleeding} onChange={(e) => setRfSevereBleeding(e.target.checked)} />
                    Severe bleeding
                  </label>
                </div>
              </div>
            </div>
          )}
          <button
            onClick={analyzeSymptoms}
            disabled={!symptoms.trim() || isAnalyzing}
            className="btn-primary w-full mt-3 disabled:opacity-50"
          >
            {isAnalyzing ? (
              <><Sparkles className="animate-pulse" size={20} /> Analyzing...</>
            ) : (
              <><Sparkles size={20} /> Find Doctors</>
            )}
          </button>
        </div>
      </div>

      {error && (
        <div className="px-4 mt-4">
          <div className="card p-4 bg-yellow-50 border border-yellow-200">
            <div className="flex items-start gap-3">
              <AlertTriangle className="text-yellow-700 mt-0.5" size={18} />
              <div className="text-sm text-yellow-800">{error}</div>
            </div>
          </div>
        </div>
      )}

      {analysis && (
        <div className="px-4 mt-4 space-y-4">
          <div className="card p-4 bg-red-50 border border-red-200">
            <h3 className="font-bold text-red-800 mb-2">Medical disclaimer</h3>
            <p className="text-sm text-red-700">
              This feature provides general health information and is not a medical diagnosis. If you have severe symptoms, worsening symptoms, or emergency warning signs, seek urgent medical care.
            </p>
          </div>

          <div className="card p-4">
            <div className="flex items-center justify-between mb-3">
              <h3 className="font-bold text-gray-800">Analysis Results</h3>
              <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase ${getUrgencyColor(analysis.urgency)}`}>
                {analysis.urgency}
              </span>
            </div>
            <p className="text-gray-600 text-sm">{analysis.summary}</p>
          </div>

          <Section title="Possible conditions (not a diagnosis)" items={analysis.possibleConditions} />
          <Section title="Common symptoms" items={analysis.commonSymptoms} />
          <Section title="Red flags (seek urgent care)" items={analysis.redFlags} />
          <Section title="Self-care / home remedies" items={analysis.selfCare} />
          <Section title="First aid" items={analysis.firstAid} />
          <Section title="Avoid" items={analysis.avoidList} />
          <Section title="Exercises" items={analysis.exercises} />

          {recommendedDoctors.length > 0 && (
            <div>
              <h3 className="font-bold text-gray-800 mb-3">Recommended Doctors</h3>
              <div className="space-y-3">
                {recommendedDoctors.map((doctor) => (
                  <Link key={doctor.id} to={`/doctor/${doctor.id}`} className="card flex items-center gap-4 p-4">
                    <div className="w-14 h-14 bg-medical-100 rounded-full flex items-center justify-center">
                      <span className="text-medical-700 font-bold">
                        {doctor.name.split(' ').map(n => n[0]).join('')}
                      </span>
                    </div>
                    <div className="flex-1">
                      <h4 className="font-bold text-gray-800">{doctor.name}</h4>
                      <p className="text-medical-600 text-sm">{doctor.specialty}</p>
                      <div className="flex items-center gap-1 text-gray-500 text-xs mt-1">
                        <MapPin size={12} /> {doctor.hospital_name}
                      </div>
                    </div>
                    <div className="flex items-center gap-1 bg-yellow-50 px-2 py-1 rounded-lg">
                      <Star size={14} className="text-yellow-500 fill-yellow-500" />
                      <span className="text-sm font-bold text-yellow-700">{doctor.rating || '—'}</span>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
