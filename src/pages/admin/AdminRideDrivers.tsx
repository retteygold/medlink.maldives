import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { CheckCircle2, XCircle, User, ArrowLeft } from 'lucide-react'
import { supabase } from '../../lib/supabase'

export default function AdminRideDrivers() {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [drivers, setDrivers] = useState<any[]>([])

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
      setDrivers(data || [])
    } catch (err: any) {
      setError(err?.message || 'Failed to load drivers')
    } finally {
      setLoading(false)
    }
  }

  async function setStatus(id: string, status: 'approved' | 'rejected') {
    try {
      const { error } = await supabase
        .from('ride_driver_profiles')
        .update({ status })
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
                </div>
              </div>

              <div className="flex flex-col gap-2 shrink-0">
                <button
                  onClick={() => setStatus(d.id, 'approved')}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-green-600 text-white text-sm font-semibold"
                >
                  <CheckCircle2 size={16} /> Approve
                </button>
                <button
                  onClick={() => setStatus(d.id, 'rejected')}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-gray-800 text-sm font-semibold border border-gray-200"
                >
                  <XCircle size={16} /> Reject
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
