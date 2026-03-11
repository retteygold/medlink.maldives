import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Car, Clock } from 'lucide-react'
import { listAdminRideTrips } from '../../lib/dataService'

export default function AdminRideTrips() {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [trips, setTrips] = useState<any[]>([])
  const [tick, setTick] = useState(0)

  useEffect(() => {
    load()
  }, [])

  useEffect(() => {
    const t = window.setInterval(() => setTick((x) => x + 1), 1000)
    return () => window.clearInterval(t)
  }, [])

  async function load() {
    setLoading(true)
    try {
      setError(null)
      const list = await listAdminRideTrips(200)
      setTrips(list)
    } catch (err: any) {
      setError(err?.message || 'Failed to load trips')
    } finally {
      setLoading(false)
    }
  }

  const rows = useMemo(() => {
    const now = Date.now()

    function msToClock(ms: number) {
      const s = Math.max(0, Math.floor(ms / 1000))
      const hh = Math.floor(s / 3600)
      const mm = Math.floor((s % 3600) / 60)
      const ss = s % 60
      const pad = (n: number) => String(n).padStart(2, '0')
      return `${pad(hh)}:${pad(mm)}:${pad(ss)}`
    }

    return (trips || []).map((t) => {
      const acceptedAt = t?.accepted_at ? Date.parse(t.accepted_at) : NaN
      const startedAt = t?.started_at ? Date.parse(t.started_at) : NaN
      const finishedAt = t?.finished_at ? Date.parse(t.finished_at) : NaN

      let base = acceptedAt
      if (Number.isFinite(startedAt)) base = startedAt

      let end = now
      if (Number.isFinite(finishedAt)) end = finishedAt

      const duration = Number.isFinite(base) ? msToClock(end - base) : '—'

      return {
        ...t,
        duration
      }
    })
  }, [tick, trips])

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
            <h1 className="text-xl font-bold">Ride Trips</h1>
            <p className="text-white/80 text-sm">Live monitoring and history</p>
          </div>
        </div>
      </div>

      <div className="px-4 py-5 space-y-3">
        <div className="flex items-center justify-between">
          <div className="text-sm text-gray-600">Total: {rows.length}</div>
          <button onClick={load} className="px-3 py-2 rounded-xl bg-white border border-gray-200 text-sm font-semibold">
            Refresh
          </button>
        </div>

        {loading ? <div className="text-sm text-gray-500">Loading...</div> : null}
        {error ? <div className="text-sm text-red-600">{error}</div> : null}

        {!loading && rows.length === 0 ? <div className="text-sm text-gray-500">No trips found.</div> : null}

        {rows.map((t: any) => (
          <div key={t.id} className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-start justify-between gap-3">
              <div className="flex items-start gap-3 min-w-0">
                <div className="w-10 h-10 rounded-xl bg-gray-100 flex items-center justify-center shrink-0">
                  <Car size={18} className="text-gray-600" />
                </div>
                <div className="min-w-0">
                  <div className="font-bold text-gray-900 truncate">
                    {String(t.status || '').toUpperCase()}
                  </div>
                  <div className="mt-1 text-sm text-gray-700 truncate">Pickup: {t.request?.origin_text || '—'}</div>
                  <div className="mt-1 text-sm text-gray-700 truncate">Destination: {t.request?.destination_text || '—'}</div>
                  <div className="mt-2 text-xs text-gray-500">
                    Driver: {t.driver?.full_name || '—'} {t.driver?.phone ? `(${t.driver.phone})` : ''}
                  </div>
                  <div className="mt-1 text-xs text-gray-500">Vehicle: {String(t.driver?.vehicle_type || '').toUpperCase()} {t.driver?.vehicle_number ? `• ${t.driver.vehicle_number}` : ''}</div>
                </div>
              </div>

              <div className="text-right shrink-0">
                <div className="inline-flex items-center gap-2 text-sm font-semibold text-gray-900">
                  <Clock size={16} className="text-gray-500" />
                  {t.duration}
                </div>
                <div className="mt-2 text-xs text-gray-500">Fare: {t.request?.fare ?? '—'}</div>
              </div>
            </div>

            <div className="mt-3 grid grid-cols-2 gap-2 text-xs text-gray-600">
              <div>
                Accepted: {t.accepted_at ? new Date(t.accepted_at).toLocaleString() : '—'}
              </div>
              <div>
                Arrived: {t.arrived_at ? new Date(t.arrived_at).toLocaleString() : '—'}
              </div>
              <div>
                Started: {t.started_at ? new Date(t.started_at).toLocaleString() : '—'}
              </div>
              <div>
                Finished: {t.finished_at ? new Date(t.finished_at).toLocaleString() : '—'}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
