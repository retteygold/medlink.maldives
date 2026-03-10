import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { Star, Phone, Mail, Clock, ChevronLeft, Calendar, Award, Home, ExternalLink } from 'lucide-react'
import type { Doctor } from '../types'
import { getDoctorById } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'
import { transliterateToDhivehi } from '../lib/transliteration'

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

function asNonEmptyUrl(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const v = value.trim()
  if (!v) return null
  return v
}

function buildGoogleSearchUrl(doctor: Doctor) {
  const q = `${doctor.name} ${doctor.hospital_name || ''} Maldives`.trim()
  return `https://www.google.com/search?q=${encodeURIComponent(q)}`
}

export default function DoctorDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { language } = useLanguage()
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

  const websiteUrl = asNonEmptyUrl(doctor.website_url)
  const googleSearchUrl = asNonEmptyUrl(doctor.google_search_url) || buildGoogleSearchUrl(doctor)
  const googleMapsUrl = asNonEmptyUrl(doctor.google_maps_url)
  const facebookUrl = asNonEmptyUrl(doctor.facebook_url)
  const instagramUrl = asNonEmptyUrl(doctor.instagram_url)
  const services = (doctor.services || []).map(s => (s || '').trim()).filter(Boolean)
  const languages = (doctor.languages || []).map(l => (l || '').trim()).filter(Boolean)

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="gradient-header px-4 pt-12 pb-6">
        <div className="flex items-center justify-between mb-4">
          <button
            type="button"
            onClick={() => (window.history.length > 1 ? navigate(-1) : navigate('/'))}
            className="flex items-center gap-2 text-white/80"
          >
            <ChevronLeft size={20} /> Back
          </button>
          <button
            type="button"
            onClick={() => navigate('/')}
            className="h-10 w-10 rounded-xl bg-white/10 hover:bg-white/20 transition-colors flex items-center justify-center"
            aria-label="Home"
          >
            <Home size={18} className="text-white" />
          </button>
        </div>
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
            <h1 className={`text-2xl font-bold text-white ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? transliterateToDhivehi(doctor.name) : doctor.name}
            </h1>
            <p className={`text-white/80 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? transliterateToDhivehi(doctor.specialty) : doctor.specialty}
            </p>
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
          <h3 className="font-bold text-gray-800 mb-3">Links</h3>
          <div className="flex flex-wrap gap-2">
            <a
              href={googleSearchUrl}
              target="_blank"
              rel="noreferrer"
              className="btn-secondary px-3 py-2 text-sm"
            >
              <ExternalLink size={16} /> Google
            </a>
            {googleMapsUrl && (
              <a
                href={googleMapsUrl}
                target="_blank"
                rel="noreferrer"
                className="btn-secondary px-3 py-2 text-sm"
              >
                <ExternalLink size={16} /> Maps
              </a>
            )}
            {websiteUrl && (
              <a
                href={websiteUrl}
                target="_blank"
                rel="noreferrer"
                className="btn-secondary px-3 py-2 text-sm"
              >
                <ExternalLink size={16} /> Website
              </a>
            )}
            {facebookUrl && (
              <a
                href={facebookUrl}
                target="_blank"
                rel="noreferrer"
                className="btn-secondary px-3 py-2 text-sm"
              >
                <ExternalLink size={16} /> Facebook
              </a>
            )}
            {instagramUrl && (
              <a
                href={instagramUrl}
                target="_blank"
                rel="noreferrer"
                className="btn-secondary px-3 py-2 text-sm"
              >
                <ExternalLink size={16} /> Instagram
              </a>
            )}
          </div>
          {(doctor.verification_source || doctor.last_verified_at) && (
            <div className="mt-3 pt-3 border-t text-xs text-gray-500">
              {doctor.verification_source ? (
                <div>Source: {doctor.verification_source}</div>
              ) : null}
              {doctor.last_verified_at ? (
                <div>Verified: {new Date(doctor.last_verified_at).toLocaleDateString()}</div>
              ) : null}
            </div>
          )}
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-2">About</h3>
          <p className="text-gray-600 text-sm">{doctor.about}</p>
        </div>

        {doctor.short_bio?.trim() && (
          <div className="card p-4">
            <h3 className="font-bold text-gray-800 mb-2">Profile</h3>
            <p className="text-gray-600 text-sm">{doctor.short_bio}</p>
          </div>
        )}

        {services.length > 0 && (
          <div className="card p-4">
            <h3 className="font-bold text-gray-800 mb-3">Services</h3>
            <div className="flex flex-wrap gap-2">
              {services.map((svc, i) => (
                <span key={i} className="px-3 py-1 bg-medical-50 text-medical-700 rounded-full text-sm border border-medical-100">
                  {svc}
                </span>
              ))}
            </div>
          </div>
        )}

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
            <p className="text-sm text-gray-600 mt-1"><span className="font-medium">Languages:</span> {languages.join(', ')}</p>
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
