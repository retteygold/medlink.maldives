import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ChevronLeft, CheckCircle2, Search } from 'lucide-react'
import {
  answerPharmacyFinderRequest,
  getSignedMedicineRequestImageUrl,
  listOpenPharmacyFinderRequests,
  listMyPharmacyFinderRequests,
  type DBPharmacyFinderRequest,
  type PharmacyFinderAvailability
} from '../../lib/dataService'

type DisplayRequest = DBPharmacyFinderRequest & { signed_image_url?: string | null }

export default function AdminPharmacyFinder() {
  const navigate = useNavigate()

  const [loading, setLoading] = useState(true)
  const [savingId, setSavingId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [search, setSearch] = useState('')

  const [requests, setRequests] = useState<DisplayRequest[]>([])
  const [draftById, setDraftById] = useState<Record<string, {
    pharmacy_name: string
    pharmacy_phone: string
    pharmacy_location: string
    availability: PharmacyFinderAvailability
  }>>({})

  const filtered = useMemo(() => {
    if (!search.trim()) return requests
    const q = search.toLowerCase()
    return requests.filter(r =>
      (r.notes?.toLowerCase().includes(q)) ||
      (r.status.toLowerCase().includes(q))
    )
  }, [requests, search])

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    setError(null)

    try {
      // Load all requests (both open and answered) for admin view
      const [openData, myData] = await Promise.all([
        listOpenPharmacyFinderRequests(),
        listMyPharmacyFinderRequests()
      ])
      
      // Combine and deduplicate
      const allRequests = [...(openData || []), ...(myData || [])]
      const uniqueRequests = allRequests.filter((req, index, self) =>
        index === self.findIndex(r => r.id === req.id)
      )

      const withUrls = await Promise.all(
        uniqueRequests.map(async (r) => {
          try {
            const url = await getSignedMedicineRequestImageUrl(r.image_path)
            return { ...r, signed_image_url: url }
          } catch {
            return { ...r, signed_image_url: null }
          }
        })
      )

      setRequests(withUrls)
      setDraftById((prev) => {
        const next = { ...prev }
        for (const r of withUrls) {
          if (!next[r.id]) {
            next[r.id] = {
              pharmacy_name: r.pharmacy_name || '',
              pharmacy_phone: r.pharmacy_phone || '',
              pharmacy_location: r.pharmacy_location || '',
              availability: r.availability || 'unknown'
            }
          }
        }
        return next
      })
    } catch (err: any) {
      setError(err?.message || 'Failed to load')
      setRequests([])
    } finally {
      setLoading(false)
    }
  }

  function updateDraft(id: string, patch: Partial<(typeof draftById)[string]>) {
    setDraftById((prev) => ({
      ...prev,
      [id]: {
        ...prev[id],
        ...patch
      }
    }))
  }

  async function onAnswer(id: string) {
    const draft = draftById[id]
    if (!draft?.pharmacy_name?.trim()) {
      setError('Pharmacy name is required')
      return
    }

    setSavingId(id)
    setError(null)

    const ok = await answerPharmacyFinderRequest({
      id,
      pharmacy_name: draft.pharmacy_name,
      pharmacy_phone: draft.pharmacy_phone,
      pharmacy_location: draft.pharmacy_location,
      availability: draft.availability
    })

    setSavingId(null)

    if (!ok) {
      setError('Failed to submit answer (check RLS / permissions)')
      return
    }

    await load()
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => navigate(-1)} className="p-2 -ml-2 hover:bg-white/10 rounded-full">
              <ChevronLeft size={24} />
            </button>
            <div>
              <h1 className="text-xl font-bold">Pharmacy Finder Admin</h1>
              <p className="text-white/80 text-sm">View and answer pharmacy requests</p>
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 py-4">
        {/* Search */}
        <div className="relative mb-4">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Search requests..."
            className="w-full pl-10 pr-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-medical-500"
          />
        </div>

        {error && (
          <div className="mb-4 bg-red-50 text-red-700 text-sm rounded-lg p-3">{error}</div>
        )}

        {loading ? (
          <p className="text-gray-500 text-sm">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-gray-500 text-sm">No requests found.</p>
        ) : (
          <div className="space-y-4">
            {filtered.map((r) => {
              const draft = draftById[r.id]
              const isAnswered = r.status === 'answered'
              return (
                <div key={r.id} className="bg-white rounded-2xl shadow-sm p-4 border border-gray-100">
                  <div className="flex items-center justify-between mb-3">
                    <div className="flex items-center gap-2">
                      <span className={`text-xs px-2 py-1 rounded-full font-medium ${
                        r.status === 'answered' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'
                      }`}>
                        {r.status}
                      </span>
                      <span className="text-xs text-gray-400">
                        {new Date(r.created_at).toLocaleString()}
                      </span>
                    </div>
                  </div>

                  {r.notes && (
                    <div className="bg-gray-50 rounded-lg p-3 mb-3">
                      <p className="text-sm text-gray-700">{r.notes}</p>
                    </div>
                  )}

                  {r.signed_image_url && (
                    <a href={r.signed_image_url} target="_blank" rel="noopener noreferrer" className="block mb-3">
                      <img src={r.signed_image_url} alt="Prescription" className="w-full rounded-xl max-h-64 object-cover" />
                    </a>
                  )}

                  {/* Answer Form */}
                  <div className="space-y-3">
                    <input
                      value={draft?.pharmacy_name || ''}
                      onChange={(e) => updateDraft(r.id, { pharmacy_name: e.target.value })}
                      placeholder="Pharmacy name *"
                      disabled={isAnswered}
                      className="w-full px-3 py-2 rounded-lg border border-gray-200 text-sm focus:outline-none focus:ring-2 focus:ring-medical-500 disabled:bg-gray-50"
                    />
                    <input
                      value={draft?.pharmacy_phone || ''}
                      onChange={(e) => updateDraft(r.id, { pharmacy_phone: e.target.value })}
                      placeholder="Phone (optional)"
                      disabled={isAnswered}
                      className="w-full px-3 py-2 rounded-lg border border-gray-200 text-sm focus:outline-none focus:ring-2 focus:ring-medical-500 disabled:bg-gray-50"
                    />
                    <input
                      value={draft?.pharmacy_location || ''}
                      onChange={(e) => updateDraft(r.id, { pharmacy_location: e.target.value })}
                      placeholder="Location (optional)"
                      disabled={isAnswered}
                      className="w-full px-3 py-2 rounded-lg border border-gray-200 text-sm focus:outline-none focus:ring-2 focus:ring-medical-500 disabled:bg-gray-50"
                    />
                    <select
                      value={draft?.availability || 'unknown'}
                      onChange={(e) => updateDraft(r.id, { availability: e.target.value as PharmacyFinderAvailability })}
                      disabled={isAnswered}
                      className="w-full px-3 py-2 rounded-lg border border-gray-200 text-sm focus:outline-none focus:ring-2 focus:ring-medical-500 disabled:bg-gray-50"
                    >
                      <option value="unknown">Unknown</option>
                      <option value="in_stock">In Stock</option>
                      <option value="out_of_stock">Out of Stock</option>
                    </select>

                    {!isAnswered && (
                      <button
                        type="button"
                        onClick={() => onAnswer(r.id)}
                        disabled={savingId === r.id}
                        className="w-full bg-medical-500 hover:bg-medical-600 text-white font-semibold py-3 rounded-xl flex items-center justify-center gap-2 disabled:opacity-50"
                      >
                        <CheckCircle2 size={18} />
                        {savingId === r.id ? 'Saving...' : 'Submit Answer'}
                      </button>
                    )}

                    {isAnswered && r.answered_at && (
                      <div className="text-xs text-green-600 text-center">
                        Answered on {new Date(r.answered_at).toLocaleString()}
                      </div>
                    )}
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}
