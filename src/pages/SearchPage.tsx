import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { Search, Users, Building2, ChevronRight, Home } from 'lucide-react'
import { searchDoctors, searchHospitals } from '../lib/dataService'
import type { Doctor, Hospital } from '../types'

export default function SearchPage() {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const q = useMemo(() => (searchParams.get('q') || '').trim(), [searchParams])

  const [queryInput, setQueryInput] = useState(q)
  const [loading, setLoading] = useState(false)
  const [doctors, setDoctors] = useState<Doctor[]>([])
  const [hospitals, setHospitals] = useState<Hospital[]>([])

  useEffect(() => {
    setQueryInput(q)
  }, [q])

  useEffect(() => {
    let cancelled = false

    async function run() {
      if (!q) {
        setDoctors([])
        setHospitals([])
        return
      }

      setLoading(true)
      try {
        const [d, h] = await Promise.all([searchDoctors(q), searchHospitals(q)])
        if (cancelled) return
        setDoctors(d)
        setHospitals(h)
      } finally {
        if (!cancelled) setLoading(false)
      }
    }

    run()
    return () => {
      cancelled = true
    }
  }, [q])

  function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    const next = queryInput.trim()
    navigate(next ? `/search?q=${encodeURIComponent(next)}` : '/search')
  }

  const totalResults = doctors.length + hospitals.length

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex items-center justify-between">
          <h1 className="text-xl font-bold text-gray-800">Search</h1>
          <button
            type="button"
            onClick={() => navigate('/')}
            className="h-10 w-10 rounded-xl bg-gray-100 hover:bg-gray-200 transition-colors flex items-center justify-center"
            aria-label="Home"
          >
            <Home size={18} className="text-gray-700" />
          </button>
        </div>

        <form onSubmit={onSubmit} className="relative mt-4">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            value={queryInput}
            onChange={(e) => setQueryInput(e.target.value)}
            placeholder="Search doctors or hospitals..."
            className="w-full pl-12 pr-14 py-3 rounded-xl bg-gray-50 text-gray-800 placeholder-gray-400 focus:outline-none border border-gray-200"
          />
          <button
            type="submit"
            className="absolute right-2 top-1/2 -translate-y-1/2 h-9 w-9 rounded-lg bg-medical-500 hover:bg-medical-600 transition-colors flex items-center justify-center"
            aria-label="Search"
          >
            <Search size={16} className="text-white" />
          </button>
        </form>
      </div>

      <div className="px-4 py-4">
        {loading ? (
          <div className="flex items-center gap-2 text-sm text-gray-600">
            <div className="w-4 h-4 border-2 border-medical-500 border-t-transparent rounded-full animate-spin"></div>
            Searching...
          </div>
        ) : !q ? (
          <div className="text-sm text-gray-600">Type a name to search doctors and hospitals.</div>
        ) : totalResults === 0 ? (
          <div className="text-sm text-gray-600">No results found for "{q}".</div>
        ) : (
          <div className="text-sm text-gray-600">{totalResults} results found for "{q}".</div>
        )}
      </div>

      {hospitals.length > 0 && (
        <div className="px-4 pb-4">
          <div className="flex items-center gap-2 mb-3">
            <Building2 size={18} className="text-medical-600" />
            <h2 className="text-lg font-bold text-gray-800">Hospitals</h2>
          </div>
          <div className="space-y-3">
            {hospitals.slice(0, 10).map((h) => (
              <Link key={h.id} to={`/hospital/${h.id}`} className="card p-4 flex items-center justify-between">
                <div className="min-w-0">
                  <div className="font-bold text-gray-800 truncate">{h.name}</div>
                  <div className="text-sm text-gray-500 truncate">{h.category} • {h.address}</div>
                </div>
                <ChevronRight size={18} className="text-gray-400" />
              </Link>
            ))}
          </div>
          {hospitals.length > 10 && (
            <Link to="/hospitals" className="inline-block mt-3 text-sm text-medical-600 font-medium">
              View all hospitals
            </Link>
          )}
        </div>
      )}

      {doctors.length > 0 && (
        <div className="px-4 pb-4">
          <div className="flex items-center gap-2 mb-3">
            <Users size={18} className="text-medical-600" />
            <h2 className="text-lg font-bold text-gray-800">Doctors</h2>
          </div>
          <div className="space-y-3">
            {doctors.slice(0, 10).map((d) => (
              <Link key={d.id} to={`/doctor/${d.id}`} className="card p-4 flex items-center justify-between">
                <div className="min-w-0">
                  <div className="font-bold text-gray-800 truncate">{d.name}</div>
                  <div className="text-sm text-gray-500 truncate">{d.specialty} • {d.hospital_name}</div>
                </div>
                <ChevronRight size={18} className="text-gray-400" />
              </Link>
            ))}
          </div>
          {doctors.length > 10 && (
            <Link to="/doctors" className="inline-block mt-3 text-sm text-medical-600 font-medium">
              View all doctors
            </Link>
          )}
        </div>
      )}
    </div>
  )
}
