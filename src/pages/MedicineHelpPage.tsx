import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Plus, Search, MessageCircle } from 'lucide-react'
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
      <div className="gradient-header px-4 pt-12 pb-8 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <button
            type="button"
            onClick={() => (window.history.length > 1 ? navigate(-1) : navigate('/'))}
            className="text-white/80 text-sm font-medium"
          >
            Back
          </button>
          <button
            type="button"
            onClick={() => navigate('/medicine-help/new')}
            className="p-2 bg-white/15 text-white rounded-xl hover:bg-white/20 transition-colors"
            aria-label="New request"
          >
            <Plus size={20} />
          </button>
        </div>

        <div className="mt-6 flex items-center gap-4">
          <div className="flex-1">
            <h1 className="text-2xl font-bold text-white">Medicine Help</h1>
            <p className="text-white/80 text-sm mt-1">Post requests and chat privately with helpers</p>
          </div>
          <img
            src="/images/storyset/Medical care-amico.svg"
            alt="Medicine Help"
            className="w-24 h-24 object-contain drop-shadow-lg"
          />
        </div>

        <div className="relative mt-5">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-white/70" size={18} />
          <input
            type="text"
            className="w-full rounded-xl bg-white/10 border border-white/20 px-11 py-3 text-white placeholder:text-white/70 outline-none"
            placeholder="Search requests..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
        </div>
      </div>

      <div className="px-4 py-4">
        <p className="text-sm text-gray-600">{loading ? 'Loading requests...' : `${filtered.length} requests`}</p>
      </div>

      <div className="px-4 space-y-3">
        {filtered.map((r) => (
          <Link key={r.id} to={`/medicine-help/${r.id}`} className="bg-white rounded-2xl p-4 shadow-sm hover:shadow-md transition-shadow block">
            <div className="flex items-start gap-3">
              <div className="w-11 h-11 rounded-2xl bg-medical-50 flex items-center justify-center">
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
          <div className="bg-white rounded-2xl p-6 text-center shadow-sm">
            <img
              src="/images/storyset/Doctors-pana.svg"
              alt="No requests"
              className="w-56 h-56 mx-auto object-contain"
            />
            <div className="mt-2 font-bold text-gray-800">No requests found</div>
            <div className="text-sm text-gray-600 mt-1">Try a different search or create a new request.</div>
            <button
              type="button"
              onClick={() => navigate('/medicine-help/new')}
              className="mt-4 btn-primary w-full"
            >
              Create a request
            </button>
          </div>
        )}
      </div>
    </div>
  )
}
