import { useState, useEffect } from 'react'
import { Search, Star, Filter, Building2 } from 'lucide-react'
import type { Hospital } from '../types'
import { getHospitals } from '../lib/dataService'

const categories = ['All', 'Private Hospital', 'General Clinic', 'Diagnostic Clinic', 'Speciality Clinic']

export default function HospitalsPage() {
  const [hospitals, setHospitals] = useState<Hospital[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('All')
  const [showFilters, setShowFilters] = useState(false)

  useEffect(() => {
    loadHospitals()
  }, [])

  async function loadHospitals() {
    const data = await getHospitals()
    setHospitals(data)
    setLoading(false)
  }

  const filteredHospitals = hospitals.filter(hospital => {
    const matchesSearch = hospital.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         hospital.address.toLowerCase().includes(searchQuery.toLowerCase())
    const matchesCategory = selectedCategory === 'All' || hospital.category === selectedCategory
    return matchesSearch && matchesCategory
  })

  return (
    <div className="min-h-screen bg-gray-50 pb-4">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <h1 className="text-xl font-bold text-gray-800 mb-4">Find Hospitals</h1>
        
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder="Search hospitals..."
            className="input-field pl-12 pr-12"
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
          </div>
        )}
      </div>

      <div className="px-4 py-3">
        <p className="text-sm text-gray-600">
          {loading ? 'Loading hospitals...' : `${filteredHospitals.length} hospitals found`}
        </p>
      </div>

      <div className="px-4 space-y-3">
        {filteredHospitals.map((hospital) => (
          <a
            key={hospital.id}
            href={`/hospital/${hospital.id}`}
            className="card p-4"
          >
            <div className="flex items-start gap-3">
              <div className="w-14 h-14 bg-gradient-to-br from-medical-100 to-medical-200 rounded-xl flex items-center justify-center">
                <Building2 size={28} className="text-medical-600" />
              </div>
              <div className="flex-1 min-w-0">
                <h3 className="font-bold text-gray-800">{hospital.name}</h3>
                <p className="text-gray-500 text-sm">{hospital.address}</p>
                <div className="flex flex-wrap gap-2 mt-2">
                  {hospital.has_emergency && (
                    <span className="text-xs bg-red-100 text-red-600 px-2 py-0.5 rounded-full font-medium">
                      24/7 Emergency
                    </span>
                  )}
                  {hospital.has_pharmacy && (
                    <span className="text-xs bg-blue-100 text-blue-600 px-2 py-0.5 rounded-full font-medium">
                      Pharmacy
                    </span>
                  )}
                </div>
                <div className="flex items-center gap-3 mt-2">
                  <div className="flex items-center gap-1">
                    <Star size={14} className="text-yellow-500 fill-yellow-500" />
                    <span className="text-sm font-medium">{hospital.rating}</span>
                    <span className="text-xs text-gray-400">({hospital.review_count} reviews)</span>
                  </div>
                </div>
              </div>
            </div>
          </a>
        ))}
      </div>
    </div>
  )
}
