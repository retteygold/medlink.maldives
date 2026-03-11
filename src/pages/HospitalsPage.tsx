import { useState, useEffect, useMemo } from 'react'
import { Search, Star, Filter, Building2, MapPin } from 'lucide-react'
import { Link } from 'react-router-dom'
import type { Hospital } from '../types'
import { getHospitals } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'
import { transliterateToDhivehi } from '../lib/transliteration'

const categories = ['All', 'Private Hospital', 'General Clinic', 'Diagnostic Clinic', 'Speciality Clinic']
const locationTypes: Array<'All' | Hospital['location_type']> = ['All', 'Male', 'Hulhumale', 'Island', 'Resort']

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

function normalizeHospitalSearchText(value: string) {
  const base = (value || '').toLowerCase().trim()
  if (!base) return ''

  // Add common Maldives hospital aliases so searches work both ways
  // Example: searching "igmh" should match "indira gandhi memorial hospital"
  // and searching "indira gandhi" should match entries that contain "igmh".
  const extras: string[] = []
  if (base.includes('igmh')) {
    extras.push('indira gandhi memorial hospital', 'indira gandhi')
  }
  if (base.includes('indira') || base.includes('gandhi')) {
    extras.push('igmh')
  }

  return [base, ...extras].join(' | ')
}

function HospitalAvatar({ hospital }: { hospital: Hospital }) {
  const [failed, setFailed] = useState(false)

  if (failed) {
    return (
      <div className="w-14 h-14 bg-gradient-to-br from-medical-100 to-medical-200 rounded-xl flex items-center justify-center">
        <Building2 size={28} className="text-medical-600" />
      </div>
    )
  }

  return (
    <div className="w-14 h-14 bg-gradient-to-br from-medical-100 to-medical-200 rounded-xl flex items-center justify-center overflow-hidden">
      <img
        src={getHospitalImageUrl(hospital)}
        alt={hospital.name}
        className="w-full h-full object-cover"
        loading="lazy"
        onError={() => setFailed(true)}
      />
    </div>
  )
}

function getHospitalMapsUrl(hospital: Hospital) {
  const explicit = (hospital.google_maps_url || '').trim()
  if (explicit) return explicit
  const query = encodeURIComponent(`${hospital.name} ${hospital.address || ''}`.trim())
  return `https://www.google.com/maps/search/?api=1&query=${query}`
}

export default function HospitalsPage() {
  const { language } = useLanguage()
  const [hospitals, setHospitals] = useState<Hospital[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('All')
  const [selectedLocationType, setSelectedLocationType] = useState<(typeof locationTypes)[number]>('All')
  const [selectedAtoll, setSelectedAtoll] = useState('All')
  const [showFilters, setShowFilters] = useState(false)

  useEffect(() => {
    loadHospitals()
  }, [])

  async function loadHospitals() {
    const data = await getHospitals()
    setHospitals(data)
    setLoading(false)
  }

  const availableAtolls = Array.from(
    new Set(
      (hospitals || [])
        .map(h => (h.atoll || '').trim())
        .filter(Boolean)
    )
  ).sort((a, b) => a.localeCompare(b))

  const filteredHospitals = hospitals.filter(hospital => {
    const q = (searchQuery || '').toLowerCase().trim()
    const normalizedHospital = normalizeHospitalSearchText(`${hospital.name} ${hospital.address || ''}`)
    const normalizedQuery = normalizeHospitalSearchText(q)
    // Also search by Dhivehi names if available
    const dhivehiText = `${hospital.name_dv || ''} ${hospital.address_dv || ''}`.toLowerCase()
    
    const matchesSearch = !q || normalizedHospital.includes(q) || normalizedHospital.includes(normalizedQuery) || dhivehiText.includes(q)
    const matchesCategory = selectedCategory === 'All' || hospital.category === selectedCategory
    const matchesLocation =
      selectedLocationType === 'All' ||
      (hospital.location_type || '').toLowerCase().trim() === selectedLocationType.toLowerCase()
    const matchesAtoll = selectedAtoll === 'All' || (hospital.atoll || '').trim() === selectedAtoll
    return matchesSearch && matchesCategory && matchesLocation && matchesAtoll
  })

  const countLabel = useMemo(() => {
    if (loading) return language === 'dv' ? 'ލޯޑް ވަނީ...' : 'Loading...'
    if (filteredHospitals.length === hospitals.length) return `${hospitals.length}`
    return `${filteredHospitals.length} / ${hospitals.length}`
  }, [filteredHospitals.length, hospitals.length, language, loading])

  return (
    <div className="min-h-screen bg-gray-50 pb-4">
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div>
          <h1 className={`text-white text-2xl font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'ހޮސްޕިޓަލްތައް' : 'Hospitals'}
          </h1>
          <div className="mt-2">
            <div className="inline-flex items-center gap-2 bg-white/15 text-white px-3 py-1.5 rounded-full text-sm">
              <span className={language === 'dv' ? 'dhivehi-font' : ''}>
                {language === 'dv' ? 'ހޯދާ' : 'Found'}
              </span>
              <span className="font-bold tabular-nums">{countLabel}</span>
            </div>
          </div>
        </div>

        <div className="mt-4 relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder={language === 'dv' ? 'ހޯދާ...' : 'Search hospitals...'}
            className="w-full pl-12 pr-12 py-4 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none shadow-lg"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          <button
            onClick={() => setShowFilters(!showFilters)}
            className="absolute right-3 top-1/2 -translate-y-1/2 p-2 hover:bg-gray-100 rounded-lg"
          >
            <Filter size={18} className={showFilters ? 'text-medical-600' : 'text-gray-400'} />
          </button>
        </div>

        {showFilters && (
          <div className="mt-4 space-y-3 border-t pt-3">
            <div>
              <label className="text-sm font-medium text-gray-600 mb-2 block">Category</label>
              <div className="flex flex-wrap gap-2">
                {categories.map(cat => (
                  <button
                    key={cat}
                    onClick={() => setSelectedCategory(cat)}
                    className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                      selectedCategory === cat 
                        ? 'bg-medical-500 text-white' 
                        : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                    }`}
                  >
                    {cat}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className="text-sm font-medium text-gray-600 mb-2 block">Area</label>
              <div className="flex flex-wrap gap-2">
                {locationTypes.map(loc => (
                  <button
                    key={loc}
                    onClick={() => setSelectedLocationType(loc)}
                    className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                      selectedLocationType === loc
                        ? 'bg-medical-500 text-white'
                        : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                    }`}
                  >
                    {loc}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className="text-sm font-medium text-gray-600 mb-2 block">Atoll</label>
              <div className="flex flex-wrap gap-2">
                <button
                  onClick={() => setSelectedAtoll('All')}
                  className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                    selectedAtoll === 'All'
                      ? 'bg-medical-500 text-white'
                      : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                  }`}
                >
                  All
                </button>
                {availableAtolls.map(at => (
                  <button
                    key={at}
                    onClick={() => setSelectedAtoll(at)}
                    className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                      selectedAtoll === at
                        ? 'bg-medical-500 text-white'
                        : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                    }`}
                  >
                    {at}
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>

      <div className="px-4 py-3" />

      <div className="px-4 space-y-3">
        {filteredHospitals.map((hospital) => (
          <Link
            key={hospital.id}
            to={`/hospital/${hospital.id}`}
            className="card p-4"
          >
            <div className="flex items-start gap-3">
              <HospitalAvatar hospital={hospital} />
              <div className="flex-1 min-w-0">
                <h3 className={`font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font text-right' : ''}`}>
                  {language === 'dv' ? (hospital.name_dv || transliterateToDhivehi(hospital.name)) : hospital.name}
                </h3>
                <p className={`text-gray-500 text-sm ${language === 'dv' ? 'dhivehi-font text-right' : ''}`}>
                  {language === 'dv'
                    ? (hospital.address_dv || transliterateToDhivehi(hospital.address || ''))
                    : hospital.address}
                </p>
                <div className={`flex flex-wrap gap-2 mt-2 ${language === 'dv' ? 'justify-end' : ''}`}>
                  {hospital.has_emergency && (
                    <span className={`text-xs bg-red-100 text-red-600 px-2 py-0.5 rounded-full font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv' ? '24/7 އިމަޖެންސީ' : '24/7 Emergency'}
                    </span>
                  )}
                  {hospital.has_pharmacy && (
                    <span className={`text-xs bg-blue-100 text-blue-600 px-2 py-0.5 rounded-full font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                      {language === 'dv' ? 'ފާރްމަސީ' : 'Pharmacy'}
                    </span>
                  )}
                </div>
                <div className={`flex items-center gap-3 mt-2 ${language === 'dv' ? 'flex-row-reverse justify-end' : ''}`}>
                  <div className="flex items-center gap-1">
                    <Star size={14} className="text-yellow-500 fill-yellow-500" />
                    <span className="text-sm font-medium">{typeof hospital.rating === 'number' ? hospital.rating.toFixed(1) : Number(hospital.rating || 0).toFixed(1)}</span>
                    <span className="text-xs text-gray-400">({hospital.review_count || 0} {language === 'dv' ? 'ރިވިއޫ' : 'reviews'})</span>
                  </div>
                </div>

                <div className={`flex items-center gap-2 mt-3 ${language === 'dv' ? 'justify-end' : ''}`}>
                  <a
                    href={getHospitalMapsUrl(hospital)}
                    target="_blank"
                    rel="noreferrer"
                    onClick={(e) => {
                      e.stopPropagation()
                      e.preventDefault()
                      window.open(getHospitalMapsUrl(hospital), '_blank', 'noopener,noreferrer')
                    }}
                    className={`inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-medical-600 text-white text-sm font-semibold shadow-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}
                    aria-label="Directions"
                  >
                    <MapPin size={16} className="text-white" />
                    <span>{language === 'dv' ? 'މަގު' : 'Directions'}</span>
                  </a>
                </div>
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}
