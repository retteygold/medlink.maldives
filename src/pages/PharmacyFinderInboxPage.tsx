import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ChevronLeft, RefreshCcw, CheckCircle2 } from 'lucide-react'
import {
  answerPharmacyFinderRequest,
  getSignedMedicineRequestImageUrl,
  listOpenPharmacyFinderRequests,
  type DBPharmacyFinderRequest,
  type PharmacyFinderAvailability
} from '../lib/dataService'

type DisplayRequest = DBPharmacyFinderRequest & { signed_image_url?: string | null }

export default function PharmacyFinderInboxPage() {
  const navigate = useNavigate()

  const [loading, setLoading] = useState(true)
  const [savingId, setSavingId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  const [requests, setRequests] = useState<DisplayRequest[]>([])
  const [draftById, setDraftById] = useState<Record<string, {
    pharmacy_name: string
    pharmacy_phone: string
    pharmacy_location: string
    availability: PharmacyFinderAvailability
  }>>({})

  const openCount = useMemo(() => requests.length, [requests])

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    setError(null)

    try {
      const data = await listOpenPharmacyFinderRequests()
      const withUrls = await Promise.all(
        (data || []).map(async (r) => {
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
              pharmacy_name: '',
              pharmacy_phone: '',
              pharmacy_location: '',
              availability: 'unknown'
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
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => navigate(-1)} className="p-2 -ml-2 hover:bg-white/10 rounded-full">
              <ChevronLeft size={24} className="text-white" />
            </button>
            <div>
              <h1 className="text-white text-2xl font-bold">Pharmacy Finder Inbox</h1>
              <p className="text-white/80 text-sm">Open requests: {openCount}</p>
            </div>
          </div>

          <button onClick={load} className="p-2 hover:bg-white/10 rounded-full" aria-label="Refresh">
            <RefreshCcw size={18} className="text-white" />
          </button>
        </div>
      </div>

      <div className="px-4 -mt-4">
        <div className="bg-white rounded-2xl shadow-lg p-4">
          {error && <div className="mb-3 bg-red-50 text-red-700 text-sm rounded-lg p-2">{error}</div>}

          {loading ? (
            <p className="text-gray-500 text-sm">Loading...</p>
          ) : requests.length === 0 ? (
            <p className="text-gray-500 text-sm">No open requests.</p>
          ) : (
            <div className="space-y-4">
              {requests.map((r) => {
                const draft = draftById[r.id]
                return (
                  <div key={r.id} className="border border-gray-100 rounded-2xl p-4">
                    <div className="flex items-center justify-between">
                      <div className="text-sm font-semibold text-gray-800">Request</div>
                      <div className="text-xs text-gray-400">{new Date(r.created_at).toLocaleString()}</div>
                    </div>

                    {r.notes && <div className="text-sm text-gray-600 mt-2">{r.notes}</div>}

                    {r.signed_image_url && (
                      <a href={r.signed_image_url} target="_blank" rel="noopener noreferrer" className="block mt-3">
                        <img src={r.signed_image_url} alt="Uploaded" className="w-full rounded-xl max-h-64 object-cover" />
                      </a>
                    )}

                    <div className="grid grid-cols-1 gap-3 mt-4">
                      <input
                        value={draft?.pharmacy_name || ''}
                        onChange={(e) => updateDraft(r.id, { pharmacy_name: e.target.value })}
                        placeholder="Pharmacy name"
                        className="input-field w-full"
                      />
                      <input
                        value={draft?.pharmacy_phone || ''}
                        onChange={(e) => updateDraft(r.id, { pharmacy_phone: e.target.value })}
                        placeholder="Phone (optional)"
                        className="input-field w-full"
                      />
                      <input
                        value={draft?.pharmacy_location || ''}
                        onChange={(e) => updateDraft(r.id, { pharmacy_location: e.target.value })}
                        placeholder="Location (optional)"
                        className="input-field w-full"
                      />
                      <select
                        value={draft?.availability || 'unknown'}
                        onChange={(e) => updateDraft(r.id, { availability: e.target.value as PharmacyFinderAvailability })}
                        className="input-field w-full"
                      >
                        <option value="unknown">unknown</option>
                        <option value="in_stock">in stock</option>
                        <option value="out_of_stock">out of stock</option>
                      </select>

                      <button
                        type="button"
                        onClick={() => onAnswer(r.id)}
                        disabled={savingId === r.id}
                        className="w-full bg-medical-500 hover:bg-medical-600 text-white font-semibold py-3 rounded-xl flex items-center justify-center gap-2 disabled:opacity-50"
                      >
                        <CheckCircle2 size={18} />
                        {savingId === r.id ? 'Saving...' : 'Submit Answer'}
                      </button>
                    </div>
                  </div>
                )
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
