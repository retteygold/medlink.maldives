import { useState, useEffect } from 'react'
import { Search, SlidersHorizontal, MapPin, Star, Phone, Calendar } from 'lucide-react'
import { Link } from 'react-router-dom'
import type { Doctor } from '../types'
import { getAllDoctors, getSpecialties } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'
import { LanguageToggle } from '../components/LanguageToggle'
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

function DoctorAvatar({ doctor, language }: { doctor: Doctor; language: string }) {
  const [failed, setFailed] = useState(false)
  const displayName = language === 'dv' ? transliterateToDhivehi(doctor.name) : doctor.name

  if (failed) {
    return (
      <div className="w-20 h-20 bg-gradient-to-br from-medical-100 via-medical-200 to-medical-300 rounded-2xl flex items-center justify-center shadow-inner">
        <span className="text-medical-700 text-2xl font-bold">
          {displayName.split(' ').map(n => n[0]).join('')}
        </span>
      </div>
    )
  }

  return (
    <div className="w-20 h-20 bg-gradient-to-br from-medical-100 via-medical-200 to-medical-300 rounded-2xl flex items-center justify-center shadow-inner overflow-hidden">
      <img
        src={getDoctorImageUrl(doctor)}
        alt={doctor.name}
        className="w-full h-full object-cover"
        loading="lazy"
        onError={() => setFailed(true)}
      />
    </div>
  )
}

export default function DoctorsPage() {
  const { t, language } = useLanguage()
  const [doctors, setDoctors] = useState<Doctor[]>([])
  const [specialties, setSpecialties] = useState<string[]>(['All'])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedSpecialty, setSelectedSpecialty] = useState('All')
  const [showFilters, setShowFilters] = useState(false)

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    try {
      setLoading(true)
      setError(null)
      console.log('Loading doctors data...')
      const [doctorsData, specialtiesData] = await Promise.all([
        getAllDoctors(),
        getSpecialties()
      ])
      console.log('Loaded doctors:', doctorsData.length)
      console.log('Loaded specialties:', specialtiesData.length)
      setDoctors(doctorsData)
      setSpecialties(['All', ...specialtiesData])
    } catch (err) {
      console.error('Error loading data:', err)
      setError('Failed to load doctors. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const filteredDoctors = doctors.filter(doc => {
    const q = searchQuery.toLowerCase()
    // Search both English and Dhivehi fields
    const matchesSearch = doc.name.toLowerCase().includes(q) ||
                         doc.specialty.toLowerCase().includes(q) ||
                         (doc.name_dv || '').toLowerCase().includes(q) ||
                         (doc.specialty_dv || '').toLowerCase().includes(q) ||
                         (doc.hospital_name_dv || '').toLowerCase().includes(q)
    const matchesSpecialty = selectedSpecialty === 'All' || doc.specialty === selectedSpecialty
    return matchesSearch && matchesSpecialty
  })

  return (
    <div className="min-h-screen bg-gray-50 pb-4">
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex justify-between items-center">
          <div>
            <h1 className={`text-white text-2xl font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.title')}</h1>
            <div className="mt-2">
              {loading ? (
                <div className="inline-flex items-center gap-2 bg-white/15 text-white px-3 py-1.5 rounded-full text-sm">
                  <span className={language === 'dv' ? 'dhivehi-font' : ''}>{t('doctors.loading')}</span>
                </div>
              ) : error ? null : (
                <div className="inline-flex items-center gap-2 bg-white/15 text-white px-3 py-1.5 rounded-full text-sm">
                  <span className={language === 'dv' ? 'dhivehi-font' : ''}>{t('doctors.found')}</span>
                  <span className="font-bold tabular-nums">
                    {filteredDoctors.length === doctors.length
                      ? `${doctors.length}`
                      : `${filteredDoctors.length} / ${doctors.length}`}
                  </span>
                </div>
              )}
            </div>
          </div>
          <LanguageToggle />
        </div>

        <div className="mt-4 relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder={t('doctors.searchPlaceholder')}
            className="w-full pl-12 pr-12 py-4 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none shadow-lg"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          <button
            onClick={() => setShowFilters(!showFilters)}
            className="absolute right-3 top-1/2 -translate-y-1/2 p-2 hover:bg-gray-100 rounded-lg"
          >
            <SlidersHorizontal size={18} className={showFilters ? 'text-medical-600' : 'text-gray-400'} />
          </button>
        </div>

        {showFilters && (
          <div className="mt-4 space-y-3 border-t pt-3">
            <div>
              <label className={`text-sm font-medium text-gray-600 mb-2 block ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.filters.specialty')}</label>
              <div className="flex flex-wrap gap-2">
                {specialties.map(spec => (
                  <button
                    key={spec}
                    onClick={() => setSelectedSpecialty(spec)}
                    className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                      selectedSpecialty === spec 
                        ? 'bg-medical-500 text-white' 
                        : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                    }`}
                  >
                    {spec}
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>

      <div className="px-4 py-3">
        {error ? (
          <div className="flex flex-col gap-2">
            <p className="text-sm text-red-600">{error}</p>
            <button onClick={loadData} className="text-sm text-medical-600 font-medium underline">
              Retry
            </button>
          </div>
        ) : null}
      </div>

      <div className="px-4 space-y-4">
        {filteredDoctors.map((doctor) => (
          <div
            key={doctor.id}
            className="card overflow-hidden hover:shadow-xl transition-all duration-300"
          >
            <div className="flex gap-4 p-4">
              {/* Doctor Avatar */}
              <div className="relative">
                <DoctorAvatar doctor={doctor} language={language} />
                {doctor.is_active && (
                  <div className="absolute -bottom-1 -right-1 w-5 h-5 bg-green-500 rounded-full border-2 border-white flex items-center justify-center">
                    <div className="w-2 h-2 bg-white rounded-full"></div>
                  </div>
                )}
              </div>
              
              {/* Doctor Info */}
              <div className="flex-1 min-w-0">
                <div className="flex items-start justify-between">
                  <div>
                    <h3 className={`font-bold text-gray-800 truncate text-lg ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv' ? (doctor.name_dv || transliterateToDhivehi(doctor.name)) : doctor.name}
                    </h3>
                    <p className={`text-medical-600 font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv'
                        ? (doctor.specialty_dv || transliterateToDhivehi(doctor.specialty))
                        : doctor.specialty}
                    </p>
                  </div>
                  <div className="flex items-center gap-1 bg-yellow-50 px-2 py-1 rounded-lg">
                    <Star size={14} className="text-yellow-500 fill-yellow-500" />
                    <span className="text-sm font-bold text-yellow-700">{doctor.rating?.toFixed(1) || '4.0'}</span>
                  </div>
                </div>
                
                <div className="flex items-center gap-1 text-gray-500 text-sm mt-2">
                  <MapPin size={14} className="text-medical-500" />
                  <span className={`truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {language === 'dv' ? (doctor.hospital_name_dv || transliterateToDhivehi(doctor.hospital_name)) : doctor.hospital_name}
                  </span>
                </div>
                
                {doctor.qualifications && doctor.qualifications.length > 0 && (
                  <div className="mt-2 flex flex-wrap gap-1">
                    {doctor.qualifications.slice(0, 2).map((qual, idx) => (
                      <span key={idx} className="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full">
                        {qual}
                      </span>
                    ))}
                  </div>
                )}
              </div>
            </div>
            
            {/* Action Buttons */}
            <div className="flex gap-2 px-4 pb-4">
              <Link
                to={`/doctor/${doctor.id}`}
                className="flex-1 bg-medical-500 hover:bg-medical-600 text-white font-medium py-2.5 px-4 rounded-xl transition-colors flex items-center justify-center gap-2"
              >
                <Calendar size={18} />
                <span className={language === 'dv' ? 'dhivehi-font' : ''}>{t('doctor.bookNow')}</span>
              </Link>
              <a
                href={`tel:${doctor.contact_phone || ''}`}
                className="bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2.5 px-4 rounded-xl transition-colors flex items-center justify-center"
              >
                <Phone size={18} />
              </a>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
