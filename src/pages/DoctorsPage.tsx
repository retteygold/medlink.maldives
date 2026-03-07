import { useState, useEffect } from 'react'
import { Search, SlidersHorizontal, MapPin, Star, Phone, Calendar } from 'lucide-react'
import type { Doctor } from '../types'
import { getDoctors, getSpecialties } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'
import { LanguageToggle } from '../components/LanguageToggle'

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
        getDoctors(),
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
    const matchesSearch = doc.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         doc.specialty.toLowerCase().includes(searchQuery.toLowerCase())
    const matchesSpecialty = selectedSpecialty === 'All' || doc.specialty === selectedSpecialty
    return matchesSearch && matchesSpecialty
  })

  return (
    <div className="min-h-screen bg-gray-50 pb-4">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex justify-between items-center mb-4">
          <h1 className={`text-xl font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.title')}</h1>
          <LanguageToggle />
        </div>
        
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder={t('doctors.searchPlaceholder')}
            className="input-field pl-12 pr-12"
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
        {loading ? (
          <div className="flex items-center gap-2 text-sm text-gray-600">
            <div className="w-4 h-4 border-2 border-medical-500 border-t-transparent rounded-full animate-spin"></div>
            {t('doctors.loading')}
          </div>
        ) : error ? (
          <div className="flex flex-col gap-2">
            <p className="text-sm text-red-600">{error}</p>
            <button 
              onClick={loadData}
              className="text-sm text-medical-600 font-medium underline"
            >
              Retry
            </button>
          </div>
        ) : (
          <p className={`text-sm text-gray-600 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {filteredDoctors.length} {t('doctors.found')}
          </p>
        )}
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
                <div className="w-20 h-20 bg-gradient-to-br from-medical-100 via-medical-200 to-medical-300 rounded-2xl flex items-center justify-center shadow-inner">
                  <span className="text-medical-700 text-2xl font-bold">
                    {doctor.name.split(' ').map(n => n[0]).join('')}
                  </span>
                </div>
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
                      {doctor.name}
                    </h3>
                    <p className={`text-medical-600 font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {doctor.specialty}
                    </p>
                  </div>
                  <div className="flex items-center gap-1 bg-yellow-50 px-2 py-1 rounded-lg">
                    <Star size={14} className="text-yellow-500 fill-yellow-500" />
                    <span className="text-sm font-bold text-yellow-700">{doctor.rating?.toFixed(1) || '4.0'}</span>
                  </div>
                </div>
                
                <div className="flex items-center gap-1 text-gray-500 text-sm mt-2">
                  <MapPin size={14} className="text-medical-500" />
                  <span className={`truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>{doctor.hospital_name}</span>
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
              <a
                href={`/doctor/${doctor.id}`}
                className="flex-1 bg-medical-500 hover:bg-medical-600 text-white font-medium py-2.5 px-4 rounded-xl transition-colors flex items-center justify-center gap-2"
              >
                <Calendar size={18} />
                <span className={language === 'dv' ? 'dhivehi-font' : ''}>{t('doctor.bookNow')}</span>
              </a>
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
