import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { CheckCircle2, XCircle, User, ArrowLeft, PauseCircle, Trash2 } from 'lucide-react'
import { supabase } from '../../lib/supabase'

export default function AdminRideDrivers() {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [drivers, setDrivers] = useState<any[]>([])
  const [imageUrls, setImageUrls] = useState<Record<string, { driver?: string | null; license?: string | null; vehicle?: string | null }>>({})

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    try {
      setError(null)
      const { data, error } = await supabase
        .from('ride_driver_profiles')
        .select('*')
        .order('created_at', { ascending: false })

      if (error) throw error
      const list = data || []
      setDrivers(list)

      const urls: Record<string, { driver?: string | null; license?: string | null; vehicle?: string | null }> = {}
      for (const d of list) {
        const id = String(d.id)
        urls[id] = {
          driver: await getSignedUrl(d.driver_image_path),
          license: await getSignedUrl(d.license_image_path),
          vehicle: await getSignedUrl(d.vehicle_image_path)
        }
      }
      setImageUrls(urls)
    } catch (err: any) {
      setError(err?.message || 'Failed to load drivers')
    } finally {
      setLoading(false)
    }
  }

  async function deleteDriver(id: string) {
    try {
      const ok = window.confirm('Delete this driver profile permanently?')
      if (!ok) return
      const { error } = await supabase
        .from('ride_driver_profiles')
        .delete()
        .eq('id', id)
      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to delete')
    }
  }

  async function getSignedUrl(path?: string | null): Promise<string | null> {
    if (!path) return null
    try {
      const { data, error } = await supabase.storage.from('medicine-requests').createSignedUrl(path, 60 * 60)
      if (error) return null
      return data?.signedUrl || null
    } catch {
      return null
    }
  }

  async function setStatus(
    id: string,
    status: 'approved' | 'rejected' | 'suspended',
    opts?: { rejectionReason?: string; suspendedReason?: string }
  ) {
    try {
      const payload: any = { status }
      if (status === 'approved') {
        payload.rejection_reason = null
        payload.suspended_reason = null
        payload.suspended_at = null
      }
      if (status === 'rejected') {
        payload.rejection_reason = (opts?.rejectionReason || '').trim() || null
        payload.suspended_reason = null
        payload.suspended_at = null
      }
      if (status === 'suspended') {
        payload.suspended_reason = (opts?.suspendedReason || '').trim() || null
        payload.suspended_at = new Date().toISOString()
      }

      const { error } = await supabase
        .from('ride_driver_profiles')
        .update(payload)
        .eq('id', id)

      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to update')
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center gap-3">
          <button
            onClick={() => navigate('/admin')}
            className="w-10 h-10 bg-white/10 rounded-xl flex items-center justify-center"
            aria-label="Back"
          >
            <ArrowLeft size={20} />
          </button>
          <div>
            <h1 className="text-xl font-bold">Ride Drivers</h1>
            <p className="text-white/80 text-sm">Approve or reject drivers</p>
          </div>
        </div>
      </div>

      <div className="px-4 py-5 space-y-3">
        {loading ? <div className="text-sm text-gray-500">Loading...</div> : null}
        {error ? <div className="text-sm text-red-600">{error}</div> : null}

        {!loading && drivers.length === 0 ? (
          <div className="text-sm text-gray-500">No drivers found.</div>
        ) : null}

        {drivers.map((d) => (
          <div key={d.id} className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-start justify-between gap-3">
              <div className="flex items-start gap-3 min-w-0">
                <div className="w-10 h-10 rounded-xl bg-gray-100 flex items-center justify-center shrink-0">
                  <User size={18} className="text-gray-600" />
                </div>
                <div className="min-w-0">
                  <div className="font-bold text-gray-900 truncate">{d.full_name}</div>
                  <div className="text-sm text-gray-600 truncate">{d.phone}</div>
                  <div className="mt-1 text-xs text-gray-500">
                    {String(d.vehicle_type || '').toUpperCase()} • {d.vehicle_brand} • {d.vehicle_color} • {d.vehicle_number}
                  </div>
                  <div className="mt-1 text-xs text-gray-500">License: {d.license_number}</div>
                  <div className="mt-1 text-xs">
                    Status: <span className="font-bold">{String(d.status || '').toUpperCase()}</span>
                  </div>
                  {d.status === 'rejected' && d.rejection_reason ? (
                    <div className="mt-2 text-xs text-red-700 bg-red-50 border border-red-200 rounded-xl p-2">
                      Rejection reason: <span className="font-semibold">{d.rejection_reason}</span>
                    </div>
                  ) : null}
                  {d.status === 'suspended' ? (
                    <div className="mt-2 text-xs text-amber-900 bg-amber-50 border border-amber-200 rounded-xl p-2">
                      Suspended{d.suspended_reason ? (
                        <>: <span className="font-semibold">{d.suspended_reason}</span></>
                      ) : null}
                    </div>
                  ) : null}
                </div>
              </div>

              <div className="flex flex-col gap-2 shrink-0">
                <button
                  onClick={() => setStatus(d.id, 'approved')}
                  disabled={String(d.status) === 'approved'}
                  className={`inline-flex items-center gap-2 px-3 py-2 rounded-xl text-white text-sm font-semibold ${String(d.status) === 'approved' ? 'bg-green-600/50 cursor-not-allowed' : 'bg-green-600'}`}
                >
                  <CheckCircle2 size={16} /> Approve
                </button>
                <button
                  onClick={() => {
                    const reason = window.prompt('Reason for rejecting this driver? (optional)') || ''
                    setStatus(d.id, 'rejected', { rejectionReason: reason })
                  }}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-gray-800 text-sm font-semibold border border-gray-200"
                >
                  <XCircle size={16} /> Reject
                </button>

                {String(d.status) === 'approved' ? (
                  <button
                    onClick={() => {
                      const reason = window.prompt('Reason for suspension? (optional)') || ''
                      setStatus(d.id, 'suspended', { suspendedReason: reason })
                    }}
                    className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-amber-600 text-white text-sm font-semibold"
                  >
                    <PauseCircle size={16} /> Suspend
                  </button>
                ) : null}

                {String(d.status) === 'suspended' ? (
                  <button
                    onClick={() => setStatus(d.id, 'approved')}
                    className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-green-600 text-white text-sm font-semibold"
                  >
                    <CheckCircle2 size={16} /> Reactivate
                  </button>
                ) : null}

                {String(d.status) === 'approved' || String(d.status) === 'rejected' || String(d.status) === 'suspended' ? (
                  <button
                    onClick={() => deleteDriver(String(d.id))}
                    className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-red-700 text-sm font-semibold border border-red-200"
                  >
                    <Trash2 size={16} /> Delete
                  </button>
                ) : null}
              </div>
            </div>

            <div className="mt-3 grid grid-cols-2 gap-3">
              {imageUrls[String(d.id)]?.driver ? (
                <a
                  href={imageUrls[String(d.id)]?.driver || undefined}
                  target="_blank"
                  rel="noreferrer"
                  className="block"
                >
                  <div className="text-xs text-gray-600 mb-1">Driver photo</div>
                  <img
                    src={imageUrls[String(d.id)]?.driver || undefined}
                    alt="Driver"
                    className="w-full h-28 object-cover rounded-xl border border-gray-200"
                    loading="lazy"
                  />
                </a>
              ) : (
                <div className="text-xs text-gray-500">No driver photo</div>
              )}

              {imageUrls[String(d.id)]?.license ? (
                <a
                  href={imageUrls[String(d.id)]?.license || undefined}
                  target="_blank"
                  rel="noreferrer"
                  className="block"
                >
                  <div className="text-xs text-gray-600 mb-1">License photo</div>
                  <img
                    src={imageUrls[String(d.id)]?.license || undefined}
                    alt="License"
                    className="w-full h-28 object-cover rounded-xl border border-gray-200"
                    loading="lazy"
                  />
                </a>
              ) : (
                <div className="text-xs text-gray-500">No license photo</div>
              )}
            </div>

            <div className="mt-3">
              {imageUrls[String(d.id)]?.vehicle ? (
                <a
                  href={imageUrls[String(d.id)]?.vehicle || undefined}
                  target="_blank"
                  rel="noreferrer"
                  className="block"
                >
                  <div className="text-xs text-gray-600 mb-1">Vehicle photo</div>
                  <img
                    src={imageUrls[String(d.id)]?.vehicle || undefined}
                    alt="Vehicle"
                    className="w-full h-36 object-cover rounded-xl border border-gray-200"
                    loading="lazy"
                  />
                </a>
              ) : (
                <div className="text-xs text-gray-500">No vehicle photo</div>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
