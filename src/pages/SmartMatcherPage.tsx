import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Sparkles, MapPin, Star } from 'lucide-react'
import type { Doctor, Hospital } from '../types'

const symptomKeywords: Record<string, { specialties: string[], urgency: string, description: string }> = {
  'chest pain': { specialties: ['Cardiology'], urgency: 'emergency', description: 'Chest pain requires immediate cardiac evaluation' },
  'headache': { specialties: ['Neurology', 'General Medicine'], urgency: 'medium', description: 'Persistent headaches may need neurological evaluation' },
  'fever': { specialties: ['General Medicine', 'Pediatrics'], urgency: 'medium', description: 'General physicians can evaluate fever causes' },
  'eye': { specialties: ['Ophthalmology'], urgency: 'medium', description: 'Eye conditions need ophthalmological care' },
  'bone': { specialties: ['Orthopedics'], urgency: 'medium', description: 'Bone and joint issues need orthopedic care' },
  'skin': { specialties: ['Dermatology'], urgency: 'low', description: 'Skin conditions are treated by dermatologists' },
  'tooth': { specialties: ['Dental'], urgency: 'medium', description: 'Dental issues need dentist evaluation' },
  'child': { specialties: ['Pediatrics'], urgency: 'medium', description: 'Children should see a pediatric specialist' },
}

const mockDoctors: Doctor[] = [
  { id: '1', name: 'Dr. Ahmed Naseem', specialty: 'Cardiology', hospital_id: '1', hospital_name: 'ADK Hospital', rating: 4.8, review_count: 124, is_active: true, created_at: '2024-01-01' },
  { id: '2', name: 'Dr. Aminath Shah', specialty: 'Pediatrics', hospital_id: '2', hospital_name: 'TreeTop Hospital', rating: 4.9, review_count: 89, is_active: true, created_at: '2024-01-01' },
  { id: '3', name: 'Dr. Mohamed Rafeeu', specialty: 'Orthopedics', hospital_id: '1', hospital_name: 'ADK Hospital', rating: 4.7, review_count: 156, is_active: true, created_at: '2024-01-01' },
]

const mockHospitals: Hospital[] = [
  { id: '1', name: 'ADK Hospital', address: 'Male\', Maldives', category: 'Private Hospital', location_type: 'Male', has_emergency: true, has_pharmacy: true, has_laboratory: true, has_radiology: true, rating: 4.7, review_count: 523, is_active: true, created_at: '2024-01-01' },
  { id: '2', name: 'TreeTop Hospital', address: 'Hulhumale\', Maldives', category: 'Private Hospital', location_type: 'Hulhumale', has_emergency: true, has_pharmacy: true, has_laboratory: true, has_radiology: true, rating: 4.6, review_count: 412, is_active: true, created_at: '2024-01-01' },
]

export default function SmartMatcherPage() {
  const navigate = useNavigate()
  const [symptoms, setSymptoms] = useState('')
  const [isAnalyzing, setIsAnalyzing] = useState(false)
  const [results, setResults] = useState<{
    matchedSpecialties: string[]
    urgency: string
    description: string
    doctors: Doctor[]
    hospitals: Hospital[]
  } | null>(null)

  const analyzeSymptoms = () => {
    setIsAnalyzing(true)
    setTimeout(() => {
      const symptomLower = symptoms.toLowerCase()
      const matchedSpecs = new Set<string>()
      let maxUrgency = 'low'
      let descriptions: string[] = []

      Object.entries(symptomKeywords).forEach(([keyword, data]) => {
        if (symptomLower.includes(keyword)) {
          data.specialties.forEach(spec => matchedSpecs.add(spec))
          descriptions.push(data.description)
          if (data.urgency === 'emergency') maxUrgency = 'emergency'
          else if (data.urgency === 'high' && maxUrgency !== 'emergency') maxUrgency = 'high'
        }
      })

      const matchedSpecialties = Array.from(matchedSpecs)
      const matchedDoctors = matchedSpecialties.length > 0 
        ? mockDoctors.filter(doc => matchedSpecialties.includes(doc.specialty))
        : mockDoctors

      setResults({
        matchedSpecialties,
        urgency: maxUrgency,
        description: descriptions[0] || 'Based on your symptoms, we recommend consulting with these specialists.',
        doctors: matchedDoctors,
        hospitals: mockHospitals
      })
      setIsAnalyzing(false)
    }, 1500)
  }

  const getUrgencyColor = (urgency: string) => {
    switch (urgency) {
      case 'emergency': return 'bg-red-500 text-white'
      case 'high': return 'bg-orange-500 text-white'
      case 'medium': return 'bg-yellow-500 text-white'
      default: return 'bg-green-500 text-white'
    }
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
          <textarea
            value={symptoms}
            onChange={(e) => setSymptoms(e.target.value)}
            placeholder="Example: I've been having chest pain and shortness of breath..."
            className="input-field min-h-[120px] resize-none"
          />
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

      {results && (
        <div className="px-4 mt-4 space-y-4">
          <div className="card p-4">
            <div className="flex items-center justify-between mb-3">
              <h3 className="font-bold text-gray-800">Analysis Results</h3>
              <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase ${getUrgencyColor(results.urgency)}`}>
                {results.urgency}
              </span>
            </div>
            <p className="text-gray-600 text-sm">{results.description}</p>
          </div>

          {results.doctors.length > 0 && (
            <div>
              <h3 className="font-bold text-gray-800 mb-3">Recommended Doctors</h3>
              <div className="space-y-3">
                {results.doctors.map((doctor) => (
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
                      <span className="text-sm font-bold text-yellow-700">{doctor.rating}</span>
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
