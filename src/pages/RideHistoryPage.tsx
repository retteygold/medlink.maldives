import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Clock, MapPin, Car, Star, Receipt } from 'lucide-react'
import { getMyRideHistory } from '../lib/dataService'
import type { RideRequest, RideTrip, RideDriverProfile } from '../types'
import { useLanguage } from '../lib/languageContext'

interface RideHistoryItem {
  request: RideRequest
  trip: (RideTrip & { driver?: RideDriverProfile | null }) | null
}

export default function RideHistoryPage() {
  const navigate = useNavigate()
  const { language } = useLanguage()
  const [rides, setRides] = useState<RideHistoryItem[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadHistory()
  }, [])

  async function loadHistory() {
    setLoading(true)
    const history = await getMyRideHistory()
    setRides(history)
    setLoading(false)
  }

  function formatDate(dateStr: string) {
    return new Date(dateStr).toLocaleDateString(language === 'dv' ? 'dv' : 'en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center gap-3">
          <button
            onClick={() => navigate('/profile')}
            className="w-10 h-10 bg-white/10 rounded-xl flex items-center justify-center"
            aria-label="Back"
          >
            <ArrowLeft size={20} />
          </button>
          <div>
            <h1 className="text-xl font-bold">
              {language === 'dv' ? 'ރައިޑް ތާރީޚު' : 'Ride History'}
            </h1>
            <p className="text-white/80 text-sm">
              {language === 'dv' ? 'ކުރިން ކުޅެވުނު ރައިޑުތައް' : 'Your past rides'}
            </p>
          </div>
        </div>
      </div>

      <div className="px-4 py-5 space-y-3">
        {loading ? (
          <div className="text-center py-8 text-gray-500">
            {language === 'dv' ? 'ލޯޑިންގ...' : 'Loading...'}
          </div>
        ) : rides.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            {language === 'dv' ? 'އެއްވެސް ރައިޑެއް ނެތް' : 'No rides yet'}
          </div>
        ) : (
          rides.map((item) => (
            <div
              key={item.request.id}
              className="bg-white rounded-xl p-4 shadow-sm border border-gray-100"
            >
              <div className="flex items-start gap-3">
                <div className="w-10 h-10 rounded-xl bg-medical-50 flex items-center justify-center shrink-0">
                  <Car size={18} className="text-medical-600" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between gap-2">
                    <span className="text-xs text-gray-500">
                      {formatDate(item.request.created_at)}
                    </span>
                    <StatusBadge status={item.trip?.status || item.request.status} />
                  </div>

                  <div className="mt-2 space-y-1">
                    <div className="flex items-start gap-2">
                      <MapPin size={14} className="text-gray-400 mt-0.5 shrink-0" />
                      <span className="text-sm text-gray-700 truncate">
                        {item.request.origin_text}
                      </span>
                    </div>
                    <div className="flex items-start gap-2">
                      <MapPin size={14} className="text-medical-500 mt-0.5 shrink-0" />
                      <span className="text-sm text-gray-700 truncate">
                        {item.request.destination_text}
                      </span>
                    </div>
                  </div>

                  <div className="mt-3 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <span className="text-xs bg-gray-100 px-2 py-1 rounded-lg">
                        {item.request.vehicle_type.toUpperCase()}
                      </span>
                      <span className="text-sm font-semibold">
                        MVR {item.request.fare}
                      </span>
                    </div>
                    {item.trip?.driver && (
                      <div className="text-xs text-gray-500">
                        {item.trip.driver.full_name}
                      </div>
                    )}
                  </div>

                  {item.trip?.status === 'finished' && (
                    <div className="mt-3 pt-3 border-t flex items-center justify-between">
                      <div className="flex items-center gap-1">
                        {item.trip.rider_rating ? (
                          <>
                            <Star size={14} className="text-yellow-500 fill-yellow-500" />
                            <span className="text-sm">{item.trip.rider_rating}/5</span>
                          </>
                        ) : (
                          <span className="text-xs text-gray-400">
                            {language === 'dv' ? 'ރޭޓިންގ ނެތް' : 'Not rated'}
                          </span>
                        )}
                      </div>
                      <button
                        onClick={() => navigate(`/ride/receipt/${item.request.id}`)}
                        className="inline-flex items-center gap-1 text-xs text-medical-600 font-medium"
                      >
                        <Receipt size={14} />
                        {language === 'dv' ? 'ރസീത്' : 'Receipt'}
                      </button>
                    </div>
                  )}
                </div>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  )
}

function StatusBadge({ status }: { status: string }) {
  const colors: Record<string, string> = {
    open: 'bg-gray-100 text-gray-600',
    matched: 'bg-blue-50 text-blue-600',
    accepted: 'bg-yellow-50 text-yellow-600',
    arrived: 'bg-purple-50 text-purple-600',
    started: 'bg-orange-50 text-orange-600',
    finished: 'bg-green-50 text-green-600',
    cancelled: 'bg-red-50 text-red-600'
  }
  return (
    <span className={`text-xs px-2 py-1 rounded-full font-medium ${colors[status] || colors.open}`}>
      {status.charAt(0).toUpperCase() + status.slice(1)}
    </span>
  )
}
