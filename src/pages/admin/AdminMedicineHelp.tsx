import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Search, RefreshCw, Truck, Star } from 'lucide-react'
import { listMedicineRequests, updateMedicineRequestStatus, getAllMedicineTransactions } from '../../lib/dataService'

type MedicineRequest = {
  id: string
  created_at: string
  user_id: string
  title: string | null
  medicine_name: string | null
  dosage: string | null
  quantity: number | null
  needed_by: string | null
  notes: string | null
  location_type: string | null
  atoll: string | null
  status: 'open' | 'in_progress' | 'shipped' | 'received' | 'completed' | 'cancelled'
}

type MedicineTransaction = {
  id: string
  request_id: string
  requester_id: string
  helper_id: string
  shipment_status: 'none' | 'shipped' | 'received' | null
  tracking_number: string | null
  shipped_at: string | null
  received_at: string | null
  completed_at: string | null
  is_active: boolean
  medicine_requests: {
    id: string
    title: string | null
    medicine_name: string | null
    user_id: string
  } | null
  medicine_reviews: {
    rating: number
    comment: string | null
  }[] | null
}

const statuses: MedicineRequest['status'][] = ['open', 'in_progress', 'shipped', 'received', 'completed', 'cancelled']

export default function AdminMedicineHelp() {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [savingId, setSavingId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [requests, setRequests] = useState<MedicineRequest[]>([])
  const [transactions, setTransactions] = useState<MedicineTransaction[]>([])
  const [query, setQuery] = useState('')
  const [activeTab, setActiveTab] = useState<'requests' | 'tracking'>('requests')

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    setError(null)
    try {
      const [reqData, txData] = await Promise.all([
        listMedicineRequests(),
        getAllMedicineTransactions()
      ])
      setRequests(reqData as any)
      setTransactions(txData as any)
    } catch (err: any) {
      setError(err?.message || 'Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const filtered = useMemo(() => {
    const q = (query || '').toLowerCase().trim()
    if (!q) return requests
    return requests.filter(r => {
      const text = `${r.title || ''} ${r.medicine_name || ''} ${r.dosage || ''} ${r.notes || ''} ${r.status}`.toLowerCase()
      return text.includes(q)
    })
  }, [query, requests])

  async function changeStatus(id: string, status: MedicineRequest['status']) {
    setSavingId(id)
    setError(null)
    try {
      const ok = await updateMedicineRequestStatus(id, status)
      if (!ok) throw new Error('Update failed')
      setRequests(prev => prev.map(r => (r.id === id ? { ...r, status } : r)))
    } catch (err: any) {
      setError(typeof err?.message === 'string' ? err.message : 'Failed to update status')
    } finally {
      setSavingId(null)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={() => navigate('/admin')}
              className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
            >
              <ArrowLeft size={20} />
            </button>
            <div>
              <h1 className="text-xl font-bold">Medicine Help</h1>
              <p className="text-white/80 text-sm">Manage requests and statuses</p>
            </div>
          </div>
          <button
            type="button"
            onClick={load}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
            aria-label="Refresh"
          >
            <RefreshCw size={20} />
          </button>
        </div>

        <div className="flex gap-4 mt-4 border-b border-white/20">
          <button
            onClick={() => setActiveTab('requests')}
            className={`pb-3 text-sm font-medium ${activeTab === 'requests' ? 'text-white border-b-2 border-white' : 'text-white/70'}`}
          >
            Requests
          </button>
          <button
            onClick={() => setActiveTab('tracking')}
            className={`pb-3 text-sm font-medium ${activeTab === 'tracking' ? 'text-white border-b-2 border-white' : 'text-white/70'}`}
          >
            Tracking & Reviews
          </button>
        </div>

        <div className="relative mt-4">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-white/60" size={18} />
          <input
            className="w-full rounded-xl bg-white/10 border border-white/20 px-11 py-3 text-white placeholder:text-white/60 outline-none"
            placeholder="Search..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
        </div>
      </div>

      <div className="p-4">
        {error && <div className="mb-3 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">{error}</div>}

        {activeTab === 'requests' ? (
          <>
            <div className="text-sm text-gray-600 mb-3">{loading ? 'Loading...' : `${filtered.length} requests`}</div>
            <div className="space-y-3">
              {filtered.map((r) => (
                <div key={r.id} className="bg-white rounded-2xl p-4 shadow-sm">
                  <div className="flex items-start justify-between gap-3">
                    <div className="min-w-0">
                      <div className="font-bold text-gray-800 truncate">{r.title || r.medicine_name || 'Medicine request'}</div>
                      <div className="text-sm text-gray-600 mt-1">
                        {[r.medicine_name, r.dosage].filter(Boolean).join(' · ')}
                      </div>
                      <div className="text-xs text-gray-500 mt-2">
                        {[r.location_type, r.atoll].filter(Boolean).join(' · ')}
                      </div>
                    </div>
                    <div className="text-xs text-gray-500">{new Date(r.created_at).toLocaleDateString()}</div>
                  </div>

                  <div className="mt-3">
                    <label className="block text-xs font-medium text-gray-600 mb-1">Status</label>
                    <div className="flex flex-wrap gap-2">
                      {statuses.map((s) => (
                        <button
                          key={s}
                          type="button"
                          disabled={savingId === r.id}
                          onClick={() => changeStatus(r.id, s)}
                          className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                            r.status === s ? 'bg-medical-500 text-white' : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                          } ${savingId === r.id ? 'opacity-60' : ''}`}
                        >
                          {s}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
              ))}

              {!loading && filtered.length === 0 && (
                <div className="bg-white rounded-2xl p-6 text-center shadow-sm">
                  <img src="/images/storyset/Hospital bed-pana.svg" alt="No requests" className="w-56 h-56 mx-auto object-contain" />
                  <div className="mt-2 font-bold text-gray-800">No requests found</div>
                  <button onClick={load} className="mt-4 btn-primary w-full">Refresh</button>
                </div>
              )}
            </div>
          </>
        ) : (
          <>
            <div className="text-sm text-gray-600 mb-3">{loading ? 'Loading...' : `${transactions.length} transactions`}</div>
            <div className="space-y-3">
              {transactions.map((tx) => {
                const review = tx.medicine_reviews?.[0]
                return (
                  <div key={tx.id} className="bg-white rounded-2xl p-4 shadow-sm">
                    <div className="flex items-start justify-between gap-3">
                      <div className="min-w-0 flex-1">
                        <div className="font-bold text-gray-800 truncate">
                          {tx.medicine_requests?.title || tx.medicine_requests?.medicine_name || 'Medicine Request'}
                        </div>
                        <div className="text-xs text-gray-500 mt-1">
                          Requester: {tx.requester_id.slice(0, 8)}... · Helper: {tx.helper_id.slice(0, 8)}...
                        </div>
                      </div>
                      <span className={`text-xs px-2 py-1 rounded-full ${
                        tx.is_active ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'
                      }`}>
                        {tx.is_active ? 'Active' : 'Completed'}
                      </span>
                    </div>

                    {/* Shipment Status */}
                    <div className="mt-3 flex items-center gap-3">
                      <div className={`w-8 h-8 rounded-full flex items-center justify-center ${
                        tx.shipment_status === 'shipped' || tx.shipment_status === 'received'
                          ? 'bg-blue-100 text-blue-600' : 'bg-gray-100 text-gray-400'
                      }`}>
                        <Truck size={16} />
                      </div>
                      <div className="flex-1">
                        <p className="text-sm font-medium">
                          {tx.shipment_status === 'none' && 'Not shipped'}
                          {tx.shipment_status === 'shipped' && `Shipped ${tx.tracking_number ? `(Tracking: ${tx.tracking_number})` : ''}`}
                          {tx.shipment_status === 'received' && 'Received by requester'}
                        </p>
                        {tx.shipped_at && (
                          <p className="text-xs text-gray-500">
                            Shipped: {new Date(tx.shipped_at).toLocaleDateString()}
                          </p>
                        )}
                      </div>
                    </div>

                    {/* Review */}
                    {review && (
                      <div className="mt-3 bg-yellow-50 rounded-xl p-3">
                        <div className="flex items-center gap-1 mb-1">
                          {[...Array(5)].map((_, i) => (
                            <Star key={i} size={14} className={i < review.rating ? 'text-yellow-500 fill-yellow-500' : 'text-gray-300'} />
                          ))}
                        </div>
                        {review.comment && <p className="text-sm text-gray-700 italic">"{review.comment}"</p>}
                      </div>
                    )}

                    {tx.completed_at && (
                      <div className="mt-2 text-xs text-gray-500">
                        Completed: {new Date(tx.completed_at).toLocaleDateString()}
                      </div>
                    )}
                  </div>
                )
              })}

              {!loading && transactions.length === 0 && (
                <div className="bg-white rounded-2xl p-6 text-center shadow-sm">
                  <img src="/images/storyset/Hospital bed-pana.svg" alt="No transactions" className="w-56 h-56 mx-auto object-contain" />
                  <div className="mt-2 font-bold text-gray-800">No transactions yet</div>
                  <div className="text-sm text-gray-600 mt-1">Transactions will appear when users start conversations.</div>
                </div>
              )}
            </div>
          </>
        )}
      </div>
    </div>
  )
}
