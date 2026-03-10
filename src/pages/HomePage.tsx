import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Search, MapPin, Stethoscope, ChevronRight, HeartPulse, Brain, Bone, Eye, Baby, Activity, Building2 } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { LanguageToggle } from '../components/LanguageToggle'
import { getDoctors, getHospitals } from '../lib/dataService'
import { transliterateToDhivehi } from '../lib/transliteration'
import type { Doctor, Hospital } from '../types'

const specialties = [
  { name: 'Cardiology', icon: HeartPulse, color: 'bg-red-100 text-red-600' },
  { name: 'Neurology', icon: Brain, color: 'bg-purple-100 text-purple-600' },
  { name: 'Orthopedics', icon: Bone, color: 'bg-orange-100 text-orange-600' },
  { name: 'Ophthalmology', icon: Eye, color: 'bg-blue-100 text-blue-600' },
  { name: 'Pediatrics', icon: Baby, color: 'bg-pink-100 text-pink-600' },
  { name: 'General Medicine', icon: Activity, color: 'bg-green-100 text-green-600' },
]

export default function HomePage() {
  const navigate = useNavigate()
  const { t, language } = useLanguage()
  const [searchQuery, setSearchQuery] = useState('')
  const [greeting, setGreeting] = useState('Hello')
  const [featuredDoctors, setFeaturedDoctors] = useState<Doctor[]>([])
  const [featuredHospitals, setFeaturedHospitals] = useState<Hospital[]>([])
  const [loadingFeatured, setLoadingFeatured] = useState(true)

  useEffect(() => {
    const hour = new Date().getHours()
    if (hour < 12) setGreeting(t('home.greeting.morning'))
    else if (hour < 17) setGreeting(t('home.greeting.afternoon'))
    else setGreeting(t('home.greeting.evening'))
  }, [t])

  useEffect(() => {
    loadFeatured()
  }, [])

  async function loadFeatured() {
    try {
      setLoadingFeatured(true)
      const [doctors, hospitals] = await Promise.all([getDoctors(), getHospitals()])
      setFeaturedDoctors(doctors.slice(0, 3))
      setFeaturedHospitals(hospitals.slice(0, 3))
    } catch {
      setFeaturedDoctors([])
      setFeaturedHospitals([])
    } finally {
      setLoadingFeatured(false)
    }
  }

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault()
    if (searchQuery.trim()) {
      navigate(`/search?q=${encodeURIComponent(searchQuery)}`)
    }
  }

  return (
    <div className={`min-h-screen pb-20 ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      {/* Header */}
      <div className="gradient-header px-4 pt-12 pb-8 rounded-b-3xl">
        <div className="flex justify-between items-center mb-4">
          <div className="flex items-center gap-3">
            <img src="/images/logo.png" alt="MedLink" className="w-10 h-10 rounded-xl" />
            <div>
              <p className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>{greeting}</p>
              <h1 className={`text-white text-2xl font-bold ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.title')}</h1>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <LanguageToggle />
            <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
              <MapPin size={20} className="text-white" />
            </div>
          </div>
        </div>

        {/* Hero Illustration */}
        <div className="flex justify-center mb-6">
          <img 
            src="/images/storyset/Doctors-pana.svg" 
            alt="Healthcare" 
            className="w-48 h-48 object-contain drop-shadow-lg"
          />
        </div>

        {/* Search Bar */}
        <form onSubmit={handleSearch} className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder={t('home.searchPlaceholder')}
            className="w-full pl-12 pr-14 py-4 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none shadow-lg"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          <button
            type="submit"
            className="absolute right-2 top-1/2 -translate-y-1/2 h-10 w-10 rounded-lg bg-medical-500 hover:bg-medical-600 transition-colors flex items-center justify-center"
            aria-label="Search"
          >
            <Search size={18} className="text-white" />
          </button>
        </form>
      </div>

      {/* Smart Matcher CTA */}
      <div className="px-4 -mt-4">
        <Link
          to="/smart-match"
          className="block bg-gradient-to-r from-medical-500 to-medical-600 rounded-xl p-4 shadow-lg shadow-medical-500/30 text-white"
        >
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center">
                <Stethoscope size={24} />
              </div>
              <div>
                <h3 className={`font-bold text-lg ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.smartMatch.title')}</h3>
                <p className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.smartMatch.subtitle')}</p>
              </div>
            </div>
            <ChevronRight size={24} />
          </div>
        </Link>
      </div>

      {/* Medicine Help CTA */}
      <div className="px-4 mt-4">
        <Link
          to="/medicine-help"
          className="block bg-gradient-to-r from-pink-500 to-rose-500 rounded-xl p-4 shadow-lg shadow-pink-500/20 text-white"
        >
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center">
                <Activity size={24} />
              </div>
              <div>
                <h3 className={`font-bold text-lg ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('medicineHelp.title')}</h3>
                <p className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('medicineHelp.subtitle')}</p>
              </div>
            </div>
            <ChevronRight size={24} />
          </div>
        </Link>
      </div>

      {/* Pharmacy Finder CTA */}
      <div className="px-4 mt-4">
        <Link
          to="/pharmacy-finder"
          className="block bg-gradient-to-r from-medical-500 to-medical-600 rounded-xl p-4 shadow-lg shadow-medical-500/20 text-white"
        >
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center">
                <MapPin size={24} />
              </div>
              <div>
                <h3 className={`font-bold text-lg ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('pharmacyFinder.title')}</h3>
                <p className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('pharmacyFinder.subtitle')}</p>
              </div>
            </div>
            <ChevronRight size={24} />
          </div>
        </Link>
      </div>

      {/* Quick Access - Hospitals & Doctors */}
      <div className="px-4 mt-4">
        <div className="grid grid-cols-2 gap-3">
          <Link
            to="/hospitals"
            className="bg-white rounded-xl p-4 shadow-sm border border-gray-100 flex items-center gap-3 hover:shadow-md transition-all"
          >
            <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center shrink-0">
              <Building2 size={24} className="text-blue-600" />
            </div>
            <div className="min-w-0">
              <h3 className={`font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('nav.hospitals')}</h3>
              <p className={`text-xs text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.hospitals.viewAll')}</p>
            </div>
          </Link>
          <Link
            to="/doctors"
            className="bg-white rounded-xl p-4 shadow-sm border border-gray-100 flex items-center gap-3 hover:shadow-md transition-all"
          >
            <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center shrink-0">
              <Stethoscope size={24} className="text-green-600" />
            </div>
            <div className="min-w-0">
              <h3 className={`font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.title')}</h3>
              <p className={`text-xs text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.doctors.viewAll')}</p>
            </div>
          </Link>
        </div>
      </div>

      {/* Specialties */}
      <div className="px-4 mt-6">
        <div className="flex justify-between items-center mb-3">
          <h2 className={`text-lg font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.specialties.title')}</h2>
          <Link to="/search" className={`text-medical-600 text-sm font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.specialties.seeAll')}</Link>
        </div>
        <div className="grid grid-cols-3 gap-3">
          {specialties.map((specialty) => (
            <Link
              key={specialty.name}
              to={`/doctors?specialty=${encodeURIComponent(specialty.name)}`}
              className="card flex flex-col items-center p-3 hover:scale-105 transition-transform"
            >
              <div className={`w-12 h-12 rounded-full flex items-center justify-center mb-2 ${specialty.color}`}>
                <specialty.icon size={24} />
              </div>
              <span className={`text-xs text-center font-medium text-gray-700 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? transliterateToDhivehi(specialty.name) : specialty.name}
              </span>
            </Link>
          ))}
        </div>
      </div>

      {/* Featured Doctors */}
      <div className="px-4 mt-6">
        <div className="flex justify-between items-center mb-3">
          <h2 className={`text-lg font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.doctors.title')}</h2>
          <Link to="/doctors" className={`text-medical-600 text-sm font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.doctors.viewAll')}</Link>
        </div>
        <div className="space-y-3">
          {loadingFeatured ? (
            <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.loading')}</div>
          ) : featuredDoctors.length === 0 ? (
            <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.loading')}</div>
          ) : (
            featuredDoctors.map((doctor) => (
              <Link
                key={doctor.id}
                to={`/doctor/${doctor.id}`}
                className="card p-4 flex items-center justify-between"
              >
                <div className="min-w-0">
                  <div className={`font-bold text-gray-800 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {language === 'dv' ? (doctor.name_dv || transliterateToDhivehi(doctor.name)) : doctor.name}
                  </div>
                  <div className={`text-sm text-gray-500 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {(language === 'dv' ? transliterateToDhivehi(doctor.specialty) : doctor.specialty)} • {(language === 'dv' ? (doctor.hospital_name_dv || transliterateToDhivehi(doctor.hospital_name)) : doctor.hospital_name)}
                  </div>
                </div>
                <ChevronRight size={18} className="text-gray-400" />
              </Link>
            ))
          )}
        </div>
      </div>

      {/* Featured Hospitals */}
      <div className="px-4 mt-6 mb-6">
        <div className="flex justify-between items-center mb-3">
          <h2 className={`text-lg font-bold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.hospitals.title')}</h2>
          <Link to="/hospitals" className={`text-medical-600 text-sm font-medium ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('home.hospitals.viewAll')}</Link>
        </div>
        <div className="space-y-3">
          {loadingFeatured ? (
            <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('hospitals.loading')}</div>
          ) : featuredHospitals.length === 0 ? (
            <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('hospitals.loading')}</div>
          ) : (
            featuredHospitals.map((hospital) => (
              <Link
                key={hospital.id}
                to={`/hospital/${hospital.id}`}
                className="card p-4 flex items-center justify-between"
              >
                <div className="min-w-0">
                  <div className={`font-bold text-gray-800 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {language === 'dv' ? (hospital.name_dv || transliterateToDhivehi(hospital.name)) : hospital.name}
                  </div>
                  <div className={`text-sm text-gray-500 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {(language === 'dv' ? transliterateToDhivehi(hospital.category) : hospital.category)} • {(language === 'dv' ? transliterateToDhivehi(hospital.address) : hospital.address)}
                  </div>
                </div>
                <ChevronRight size={18} className="text-gray-400" />
              </Link>
            ))
          )}
        </div>
      </div>
    </div>
  )
}
