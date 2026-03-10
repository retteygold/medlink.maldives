import { useState, useEffect } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { MapPin, Star, Phone, Mail, Clock, ChevronLeft, Globe, Building2, Siren, Pill, FlaskConical, Stethoscope, Home, Navigation } from 'lucide-react'
import type { Hospital, Doctor } from '../types'
import { getHospitalById, getDoctors } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'
import { transliterateToDhivehi } from '../lib/transliteration'

function slugifyFileName(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '')
}

function getHospitalImageUrl(hospital: Hospital) {
  const explicit = (hospital.image_url || '').trim()
  if (explicit) return explicit
  return `/images/hospitals/${slugifyFileName(hospital.name)}.jpg`
}

function getHospitalMapsUrl(hospital: Hospital) {
  const explicit = (hospital.google_maps_url || '').trim()
  if (explicit) return explicit

  const query = encodeURIComponent(`${hospital.name} ${hospital.address || ''}`.trim())
  return `https://www.google.com/maps/search/?api=1&query=${query}`
}

export default function HospitalDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { language } = useLanguage()
  const [hospital, setHospital] = useState<Hospital | null>(null)
  const [doctors, setDoctors] = useState<Doctor[]>([])
  const [loading, setLoading] = useState(true)
  const [imageFailed, setImageFailed] = useState(false)
  const [doctorSearch, setDoctorSearch] = useState('')

  useEffect(() => {
    loadHospitalData()
  }, [id])

  async function loadHospitalData() {
    if (!id) return
    
    const hospitalData = await getHospitalById(id)
    setHospital(hospitalData || null)
    
    const allDoctors = await getDoctors()
    const hospitalDoctors = allDoctors.filter(d => {
      if (!hospitalData) return false

      const doctorHospitalId = (d as any).hospital_id as string | null | undefined
      if (doctorHospitalId && doctorHospitalId === hospitalData.id) return true

      const doctorHospitalName = (d.hospital_name || '').toLowerCase().trim()
      const hospitalName = (hospitalData.name || '').toLowerCase().trim()
      if (!doctorHospitalName || !hospitalName) return false

      return doctorHospitalName === hospitalName
    })
    setDoctors(hospitalDoctors)
    setLoading(false)
  }

  const filteredDoctorSuggestions = doctors
    .filter(d => {
      const q = (doctorSearch || '').toLowerCase().trim()
      if (!q) return true
      return d.name.toLowerCase().includes(q)
    })
    .slice(0, 10)

  function submitDoctorSearch(e: React.FormEvent) {
    e.preventDefault()
    const q = (doctorSearch || '').toLowerCase().trim()
    if (!q) return

    const exact = doctors.find(d => d.name.toLowerCase().trim() === q)
    const firstMatch = doctors.find(d => d.name.toLowerCase().includes(q))
    const target = exact || firstMatch
    if (target) {
      navigate(`/doctor/${target.id}`)
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-gray-500">Loading hospital details...</div>
      </div>
    )
  }

  if (!hospital) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-gray-500">Hospital not found</div>
      </div>
    )
  }

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
          <div className="w-20 h-20 bg-white/20 rounded-xl flex items-center justify-center overflow-hidden">
            {imageFailed ? (
              <Building2 size={36} className="text-white" />
            ) : (
              <img
                src={getHospitalImageUrl(hospital)}
                alt={hospital.name}
                className="w-full h-full object-cover"
                loading="lazy"
                onError={() => setImageFailed(true)}
              />
            )}
          </div>
          <div>
            <h1 className={`text-2xl font-bold text-white ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? transliterateToDhivehi(hospital.name) : hospital.name}
            </h1>
            <p className={`text-white/80 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? transliterateToDhivehi(hospital.category) : hospital.category}
            </p>
            <div className="flex items-center gap-1 mt-1">
              <Star size={16} className="text-yellow-300 fill-yellow-300" />
              <span className="text-white">{hospital.rating?.toFixed(1) || '4.0'}</span>
              <span className="text-white/60">({hospital.review_count || 0} reviews)</span>
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 -mt-4 space-y-3">
        <div className="card p-4 flex gap-3">
          <a href={`tel:${hospital.contact_phone || '+960 331-3553'}`} className="btn-primary flex-1">
            <Phone size={18} /> Call Now
          </a>
          <a
            href={getHospitalMapsUrl(hospital)}
            target="_blank"
            rel="noopener noreferrer"
            className="btn-secondary px-4"
            aria-label="Open in Maps"
          >
            <Navigation size={18} />
          </a>
          <a href={hospital.website || '#'} target="_blank" rel="noopener noreferrer" className="btn-secondary px-4">
            <Globe size={18} />
          </a>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-2">About</h3>
          <p className="text-gray-600 text-sm">
            {hospital.description || `${hospital.name} is a registered healthcare facility in the Maldives providing ${hospital.category.toLowerCase()} services.`}
          </p>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-3">Facilities</h3>
          <div className="grid grid-cols-2 gap-3">
            {hospital.has_emergency && (
              <div className="flex items-center gap-2 p-3 bg-red-50 rounded-lg">
                <Siren size={20} className="text-red-600" />
                <span className="text-sm font-medium text-red-700">24/7 Emergency</span>
              </div>
            )}
            {hospital.has_pharmacy && (
              <div className="flex items-center gap-2 p-3 bg-blue-50 rounded-lg">
                <Pill size={20} className="text-blue-600" />
                <span className="text-sm font-medium text-blue-700">Pharmacy</span>
              </div>
            )}
            {hospital.has_laboratory && (
              <div className="flex items-center gap-2 p-3 bg-green-50 rounded-lg">
                <FlaskConical size={20} className="text-green-600" />
                <span className="text-sm font-medium text-green-700">Laboratory</span>
              </div>
            )}
          </div>
        </div>

        <div className="card p-4">
          <div className="flex items-start gap-3">
            <Clock size={20} className="text-medical-600 mt-0.5" />
            <div>
              <h3 className="font-bold text-gray-800">Opening Hours</h3>
              <p className="text-medical-600 font-medium mt-1">{hospital.opening_hours || 'Contact for hours'}</p>
            </div>
          </div>
        </div>

        <div className="card p-4">
          <div className="flex items-start gap-3">
            <MapPin size={20} className="text-medical-600 mt-0.5" />
            <div>
              <h3 className="font-bold text-gray-800">Address</h3>
              <p className={`text-gray-600 text-sm mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? transliterateToDhivehi(hospital.address || '') : hospital.address}
              </p>
            </div>
          </div>
        </div>

        <div className="card p-4">
          <h3 className="font-bold text-gray-800 mb-3">Contact</h3>
          <a href={`tel:${hospital.contact_phone || ''}`} className="flex items-center gap-3 py-2">
            <Phone size={20} className="text-medical-600" />
            <span className="text-gray-700">{hospital.contact_phone || 'Contact via email'}</span>
          </a>
          <a href={`mailto:${hospital.email || ''}`} className="flex items-center gap-3 py-2">
            <Mail size={20} className="text-medical-600" />
            <span className="text-gray-700">{hospital.email || 'Not available'}</span>
          </a>
        </div>

        {/* Doctors at this Hospital */}
        <div className="card p-4">
          <div className="flex items-center gap-2 mb-4">
            <Stethoscope size={20} className="text-medical-600" />
            <h3 className={`font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? `${transliterateToDhivehi(hospital.name)} ގެ ޑޮކްޓަރުން (${doctors.length})` : `Doctors at ${hospital.name} (${doctors.length})`}
            </h3>
          </div>

          <form onSubmit={submitDoctorSearch} className="mb-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Search a doctor in this hospital
            </label>
            <div className="relative">
              <input
                type="text"
                value={doctorSearch}
                onChange={(e) => setDoctorSearch(e.target.value)}
                className="input-field"
                placeholder="Type doctor name..."
                list="hospital-doctor-suggestions"
              />
              <datalist id="hospital-doctor-suggestions">
                {filteredDoctorSuggestions.map((d) => (
                  <option key={d.id} value={d.name} />
                ))}
              </datalist>
            </div>

            {doctorSearch.trim().length > 0 && filteredDoctorSuggestions.length > 0 && (
              <div className="mt-2 bg-white border border-gray-200 rounded-xl overflow-hidden">
                {filteredDoctorSuggestions.map((d) => (
                  <button
                    key={d.id}
                    type="button"
                    onClick={() => navigate(`/doctor/${d.id}`)}
                    className="w-full text-left px-3 py-2 text-sm hover:bg-gray-50"
                  >
                    <div className="font-medium text-gray-800">{d.name}</div>
                    <div className="text-xs text-gray-500">{d.specialty}</div>
                  </button>
                ))}
              </div>
            )}
          </form>
          
          {doctors.length > 0 ? (
            <div className="space-y-3">
              {doctors.slice(0, 5).map((doctor) => (
                <a
                  key={doctor.id}
                  href={`/doctor/${doctor.id}`}
                  className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
                >
                  <div className="w-12 h-12 bg-gradient-to-br from-medical-100 to-medical-200 rounded-full flex items-center justify-center">
                    <span className="text-sm font-bold text-gray-700">{doctor.rating?.toFixed(1) || '4.0'}</span>
                  </div>
                  <div className="flex-1 min-w-0">
                    <h4 className={`font-bold text-gray-800 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv' ? transliterateToDhivehi(doctor.name) : doctor.name}
                    </h4>
                    <p className={`text-medical-600 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv' ? transliterateToDhivehi(doctor.specialty) : doctor.specialty}
                    </p>
                  </div>
                </a>
              ))}
              {doctors.length > 5 && (
                <a 
                  href={`/doctors?hospital=${encodeURIComponent(hospital.name)}`}
                  className="block text-center text-medical-600 font-medium py-2 hover:bg-medical-50 rounded-lg transition-colors"
                >
                  View all {doctors.length} doctors →
                </a>
              )}
            </div>
          ) : (
            <div className="text-center py-6">
              <Stethoscope size={40} className="text-gray-300 mx-auto mb-2" />
              <p className="text-gray-500 text-sm">No doctors listed for this hospital yet.</p>
              <p className="text-gray-400 text-xs mt-1">Contact the hospital directly for doctor information.</p>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
