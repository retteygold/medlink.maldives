import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Plus, Search, ChevronLeft, MessageCircle } from 'lucide-react'
import { listMedicineRequests } from '../lib/dataService'

type MedicineRequest = {
  id: string
  created_at: string
  user_id: string
  title?: string
  medicine_name?: string
  dosage?: string
  quantity?: number
  needed_by?: string
  notes?: string
  location_type?: string
  atoll?: string
  status: 'open' | 'in_progress' | 'fulfilled' | 'cancelled'
}

export default function MedicineHelpPage() {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [requests, setRequests] = useState<MedicineRequest[]>([])
  const [query, setQuery] = useState('')

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    const data = await listMedicineRequests()
    setRequests(data as any)
    setLoading(false)
  }

  const filtered = useMemo(() => {
    const q = (query || '').toLowerCase().trim()
    if (!q) return requests
    return requests.filter(r => {
      const text = `${r.title || ''} ${r.medicine_name || ''} ${r.dosage || ''} ${r.notes || ''}`.toLowerCase()
      return text.includes(q)
    })
  }, [query, requests])

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex items-center justify-between">
          <button type="button" onClick={() => (window.history.length > 1 ? navigate(-1) : navigate('/profile'))} className="p-2 -ml-2">
            <ChevronLeft size={22} className="text-gray-600" />
          </button>
          <h1 className="text-xl font-bold text-gray-800">Medicine Help</h1>
          <button
            type="button"
            onClick={() => navigate('/medicine-help/new')}
            className="p-2 bg-medical-500 text-white rounded-xl"
            aria-label="New request"
          >
            <Plus size={20} />
          </button>
        </div>

        <div className="relative mt-4">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={18} />
          <input
            type="text"
            className="input-field pl-11"
            placeholder="Search requests..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
        </div>
      </div>

      <div className="px-4 py-3">
        <p className="text-sm text-gray-600">
          {loading ? 'Loading requests...' : `${filtered.length} requests`}
        </p>
      </div>

      <div className="px-4 space-y-3">
        {filtered.map((r) => (
          <Link key={r.id} to={`/medicine-help/${r.id}`} className="card p-4 block">
            <div className="flex items-start gap-3">
              <div className="w-10 h-10 rounded-xl bg-medical-50 flex items-center justify-center">
                <MessageCircle size={18} className="text-medical-600" />
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between gap-3">
                  <h3 className="font-bold text-gray-800 truncate">{r.title || r.medicine_name || 'Medicine request'}</h3>
                  <span
                    className={`text-xs px-2 py-0.5 rounded-full font-medium ${
                      r.status === 'open'
                        ? 'bg-green-100 text-green-700'
                        : r.status === 'in_progress'
                          ? 'bg-yellow-100 text-yellow-700'
                          : r.status === 'fulfilled'
                            ? 'bg-gray-200 text-gray-700'
                            : 'bg-red-100 text-red-700'
                    }`}
                  >
                    {r.status}
                  </span>
                </div>
                {(r.medicine_name || r.dosage) && (
                  <p className="text-sm text-gray-600 mt-1">
                    {[r.medicine_name, r.dosage].filter(Boolean).join(' · ')}
                  </p>
                )}
                {(r.location_type || r.atoll) && (
                  <p className="text-xs text-gray-500 mt-2">
                    {[r.location_type, r.atoll].filter(Boolean).join(' · ')}
                  </p>
                )}
              </div>
            </div>
          </Link>
        ))}

        {!loading && filtered.length === 0 && (
          <div className="card p-6 text-center text-gray-500">No requests found.</div>
        )}
      </div>
    </div>
  )
}
