import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ChevronLeft, Upload, Phone, MapPin, Package } from 'lucide-react'
import {
  createPharmacyFinderRequest,
  getSignedMedicineRequestImageUrl,
  listMyPharmacyFinderRequests,
  uploadPharmacyFinderImage,
  type DBPharmacyFinderRequest
} from '../lib/dataService'

type DisplayRequest = DBPharmacyFinderRequest & { signed_image_url?: string | null }

export default function PharmacyFinderPage() {
  const navigate = useNavigate()
  const fileInputRef = useRef<HTMLInputElement>(null)

  const [loading, setLoading] = useState(true)
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const [notes, setNotes] = useState('')
  const [requests, setRequests] = useState<DisplayRequest[]>([])

  const latest = useMemo(() => requests[0] || null, [requests])

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    setError(null)
    try {
      const data = await listMyPharmacyFinderRequests()
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
    } catch (err: any) {
      setError(err?.message || 'Failed to load')
      setRequests([])
    } finally {
      setLoading(false)
    }
  }

  async function onPickFile(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return

    setSubmitting(true)
    setError(null)

    try {
      const path = await uploadPharmacyFinderImage(file)
      const created = await createPharmacyFinderRequest({
        image_path: path,
        notes
      })
      if (!created?.id) {
        setError('Failed to submit request')
        return
      }
      setNotes('')
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to submit')
    } finally {
      setSubmitting(false)
      if (fileInputRef.current) fileInputRef.current.value = ''
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex items-center gap-3">
          <button onClick={() => navigate(-1)} className="p-2 -ml-2 hover:bg-white/10 rounded-full">
            <ChevronLeft size={24} className="text-white" />
          </button>
          <div className="flex-1">
            <h1 className="text-white text-2xl font-bold">Pharmacy Finder</h1>
            <p className="text-white/80 text-sm">Upload a prescription/medicine photo and we’ll help find a pharmacy.</p>
          </div>
        </div>
      </div>

      <div className="px-4 -mt-4">
        <div className="bg-white rounded-2xl shadow-lg p-4">
          {error && <div className="mb-3 bg-red-50 text-red-700 text-sm rounded-lg p-2">{error}</div>}

          <div className="space-y-3">
            <textarea
              value={notes}
              onChange={(e) => setNotes(e.target.value)}
              placeholder="Optional notes (medicine name, dosage, where you searched, etc.)"
              rows={3}
              className="input-field w-full resize-none"
            />

            <input ref={fileInputRef} type="file" accept="image/*" onChange={onPickFile} className="hidden" />

            <button
              type="button"
              onClick={() => fileInputRef.current?.click()}
              disabled={submitting}
              className="w-full bg-medical-500 hover:bg-medical-600 text-white font-semibold py-3 rounded-xl flex items-center justify-center gap-2 disabled:opacity-50"
            >
              <Upload size={18} />
              {submitting ? 'Uploading...' : 'Upload Prescription / Medicine Photo'}
            </button>

            <div className="text-xs text-gray-500">
              If you can’t wait, you can share the image via Viber to <span className="font-semibold">Shikavathi Chatline +7951400</span>.
            </div>

            <div className="pt-2">
              <Link to="/pharmacy-finder/inbox" className="text-sm text-medical-600 font-medium">
                Provider/Admin Inbox
              </Link>
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 mt-4">
        <div className="bg-white rounded-2xl shadow-sm p-4">
          <h2 className="font-bold text-gray-800">Latest Status</h2>

          {loading ? (
            <p className="text-gray-500 text-sm mt-2">Loading...</p>
          ) : !latest ? (
            <p className="text-gray-500 text-sm mt-2">No requests yet. Upload an image to start.</p>
          ) : (
            <div className="mt-3 space-y-3">
              {latest.signed_image_url && (
                <a href={latest.signed_image_url} target="_blank" rel="noopener noreferrer" className="block">
                  <img src={latest.signed_image_url} alt="Uploaded" className="w-full rounded-xl max-h-64 object-cover" />
                </a>
              )}

              <div className="flex items-center justify-between">
                <span className={`text-xs px-2 py-1 rounded-full font-medium ${
                  latest.status === 'answered' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'
                }`}>
                  {latest.status}
                </span>
                <span className="text-xs text-gray-400">{new Date(latest.created_at).toLocaleString()}</span>
              </div>

              {latest.status !== 'answered' ? (
                <div className="bg-blue-50 text-blue-800 text-sm rounded-xl p-3">
                  We’re checking pharmacies. If you need urgent help, share the image via Viber to <span className="font-semibold">+7951400</span>.
                </div>
              ) : (
                <div className="bg-green-50 text-green-900 rounded-xl p-3 space-y-2">
                  <div className="font-semibold">{latest.pharmacy_name}</div>
                  {latest.availability && (
                    <div className="flex items-center gap-2 text-sm">
                      <Package size={16} />
                      <span>{latest.availability.replace(/_/g, ' ')}</span>
                    </div>
                  )}
                  {latest.pharmacy_phone && (
                    <div className="flex items-center gap-2 text-sm">
                      <Phone size={16} />
                      <span>{latest.pharmacy_phone}</span>
                    </div>
                  )}
                  {latest.pharmacy_location && (
                    <div className="flex items-center gap-2 text-sm">
                      <MapPin size={16} />
                      <span>{latest.pharmacy_location}</span>
                    </div>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      </div>

      <div className="px-4 mt-4">
        <div className="bg-white rounded-2xl shadow-sm p-4">
          <h2 className="font-bold text-gray-800">My Requests</h2>
          {loading ? (
            <p className="text-gray-500 text-sm mt-2">Loading...</p>
          ) : requests.length === 0 ? (
            <p className="text-gray-500 text-sm mt-2">No requests.</p>
          ) : (
            <div className="mt-3 space-y-3">
              {requests.map((r) => (
                <div key={r.id} className="border border-gray-100 rounded-xl p-3">
                  <div className="flex items-center justify-between">
                    <span className={`text-xs px-2 py-1 rounded-full font-medium ${
                      r.status === 'answered' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'
                    }`}>
                      {r.status}
                    </span>
                    <span className="text-xs text-gray-400">{new Date(r.created_at).toLocaleString()}</span>
                  </div>

                  {r.notes && <p className="text-sm text-gray-600 mt-2">{r.notes}</p>}

                  {r.status === 'answered' && r.pharmacy_name && (
                    <p className="text-sm font-semibold text-gray-800 mt-2">{r.pharmacy_name}</p>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
