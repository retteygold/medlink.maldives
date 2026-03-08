import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { Star, Phone, Mail, Clock, ChevronLeft, Calendar, Award } from 'lucide-react'
import type { Doctor } from '../types'
import { getDoctorById } from '../lib/dataService'

function slugifyFileName(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '')
}

function getDoctorImageUrl(doctor: Doctor) {
  const explicit = (doctor.image_url || '').trim()
  if (explicit) return explicit
  return `/images/doctors/${slugifyFileName(doctor.name)}.jpg`
}

export default function DoctorDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [doctor, setDoctor] = useState<Doctor | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    load()
  }, [id])

  async function load() {
    if (!id) return
    setLoading(true)
    const data = await getDoctorById(id)
    setDoctor(data || null)
    setLoading(false)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-gray-500">Loading doctor details...</div>
      </div>
    )
  }

  if (!doctor) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-gray-500">Doctor not found</div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="gradient-header px-4 pt-12 pb-6">
        <button onClick={() => window.history.back()} className="flex items-center gap-2 text-white/80 mb-4">
          <ChevronLeft size={20} /> Back
        </button>
        <div className="flex items-center gap-4">
          <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center overflow-hidden">
            <img
              src={getDoctorImageUrl(doctor)}
              alt={doctor.name}
              className="w-full h-full object-cover"
              loading="lazy"
              onError={(e) => {
                const img = e.currentTarget
                img.style.display = 'none'
                const parent = img.parentElement
                if (!parent) return
                if (parent.querySelector('[data-fallback="initials"]')) return
                const span = document.createElement('span')
                span.setAttribute('data-fallback', 'initials')
                span.className = 'text-white text-2xl font-bold'
                span.textContent = doctor.name.split(' ').map(n => n[0]).join('')
                parent.appendChild(span)
              }}
            />
          </div>
          <div>
            <h1 className="text-2xl font-bold text-white">{doctor.name}</h1>
            <p className="text-white/80">{doctor.specialty}</p>
            <div className="flex items-center gap-1 mt-1">
              <Star size={16} className="text-yellow-300 fill-yellow-300" />
              <span className="text-white">{doctor.rating?.toFixed(1) || '4.0'}</span>
              <span className="text-white/60">({doctor.review_count || 0} reviews)</span>
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 -mt-4 space-y-3">
        <div className="card p-4 flex gap-3">
          <button className="btn-primary flex-1">
            <Calendar size={18} /> Book Appointment
          </button>
          <a href={`tel:${doctor.contact_phone}`} className="btn-secondary px-4">
            <Phone size={18} />
          </a>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-2">About</h3>
          <p className="text-gray-600 text-sm">{doctor.about}</p>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-3">Qualifications</h3>
          <div className="flex flex-wrap gap-2">
            {doctor.qualifications?.map((qual, i) => (
              <span key={i} className="px-3 py-1 bg-medical-100 text-medical-700 rounded-full text-sm">
                <Award size={14} className="inline mr-1" /> {qual}
              </span>
            ))}
          </div>
          <div className="mt-3 pt-3 border-t">
            <p className="text-sm text-gray-600"><span className="font-medium">Experience:</span> {doctor.experience_years} years</p>
            <p className="text-sm text-gray-600 mt-1"><span className="font-medium">Languages:</span> {doctor.languages?.join(', ')}</p>
          </div>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-3">Availability</h3>
          <div className="flex items-start gap-3">
            <Clock size={20} className="text-medical-600 mt-0.5" />
            <div>
              <p className="text-sm font-medium">{doctor.available_days?.join(', ')}</p>
              <p className="text-sm text-gray-500">{doctor.available_times?.join(', ')}</p>
            </div>
          </div>
          <div className="mt-3 pt-3 border-t flex items-center justify-between">
            <span className="text-sm text-gray-600">Consultation Fee</span>
            <span className="font-bold text-medical-600">MVR {doctor.consultation_fee}</span>
          </div>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-3">Contact</h3>
          <a href={`tel:${doctor.contact_phone}`} className="flex items-center gap-3 py-2">
            <Phone size={20} className="text-medical-600" />
            <span className="text-gray-700">{doctor.contact_phone}</span>
          </a>
          <a href={`mailto:${doctor.email}`} className="flex items-center gap-3 py-2">
            <Mail size={20} className="text-medical-600" />
            <span className="text-gray-700">{doctor.email}</span>
          </a>
        </div>
      </div>
    </div>
  )
}
