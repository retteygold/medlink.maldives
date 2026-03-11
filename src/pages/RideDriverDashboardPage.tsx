import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronLeft, Car, CheckCircle2, MapPin, Play, Flag, Star } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import {
  acceptRideRequest,
  getDriverActiveTrip,
  getDriverOpenRideRequests,
  getMyRideDriverProfile,
  updateRideTripStatus
} from '../lib/dataService'

export default function RideDriverDashboardPage() {
  const { language } = useLanguage()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [profile, setProfile] = useState<any>(null)
  const [requests, setRequests] = useState<any[]>([])
  const [activeTrip, setActiveTrip] = useState<any>(null)

  const [rating, setRating] = useState('5')
  const [ratingComment, setRatingComment] = useState('')
  const [savingFinish, setSavingFinish] = useState(false)

  useEffect(() => {
    load()
    const t = window.setInterval(load, 5000)
    return () => window.clearInterval(t)
  }, [])

  async function load() {
    try {
      setError(null)
      const me = await getMyRideDriverProfile()
      setProfile(me)

      if (!me?.id) {
        setRequests([])
        setActiveTrip(null)
        setLoading(false)
        return
      }

      const trip = await getDriverActiveTrip()
      setActiveTrip(trip)

      if (!trip?.id && String(me.status) === 'approved') {
        const open = await getDriverOpenRideRequests(String(me.vehicle_type))
        setRequests(open)
      } else {
        setRequests([])
      }
    } catch (err: any) {
      setError(err?.message || 'Failed to load dashboard')
    } finally {
      setLoading(false)
    }
  }

  const canDrive = useMemo(() => String(profile?.status) === 'approved', [profile?.status])

  async function onAccept(requestId: string) {
    try {
      setLoading(true)
      await acceptRideRequest(requestId)
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to accept')
      setLoading(false)
    }
  }

  async function onStatus(next: 'arrived' | 'started') {
    if (!activeTrip?.id) return
    try {
      setLoading(true)
      await updateRideTripStatus(activeTrip.id, next)
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to update')
      setLoading(false)
    }
  }

  async function onFinish() {
    if (!activeTrip?.id) return
    setSavingFinish(true)
    try {
      await updateRideTripStatus(activeTrip.id, 'finished', {
        cash_paid: true,
        amount: Number(activeTrip?.request?.fare || 0),
        rider_rating: Number(rating),
        rider_rating_comment: ratingComment
      })
      setRating('5')
      setRatingComment('')
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to finish ride')
    } finally {
      setSavingFinish(false)
    }
  }

  return (
    <div className={`min-h-screen pb-24 ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <Link
            to="/ride"
            className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center"
            aria-label="Back"
          >
            <ChevronLeft size={20} className="text-white" />
          </Link>
          <h1 className={`text-white text-xl font-bold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'ޑްރައިވަރ ޑޭޝްބޯރޑް' : 'Driver Dashboard'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
            <Car size={22} className="text-white" />
          </div>
          <div className="min-w-0">
            <div className={`text-white text-lg font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {profile?.id
                ? (canDrive ? (language === 'dv' ? 'އެޕްރޫވް' : 'Approved') : (language === 'dv' ? 'ޕެންޑިންގ' : 'Pending approval'))
                : (language === 'dv' ? 'ރަޖިސްޓަރ ކުރޭ' : 'Register first')}
            </div>
            <div className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {profile?.id
                ? (language === 'dv' ? 'ރައިޑް ރިކުއެސްޓް ބަލާ' : 'Accept ride requests')
                : (language === 'dv' ? 'ޕްރޮފައިލް ހަދާ' : 'Create your driver profile')}
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 mt-5 space-y-3">
        {!profile?.id ? (
          <div className="card p-4">
            <div className={`font-bold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ޑްރައިވަރު ޕްރޮފައިލެއް ނެތް' : 'No driver profile found'}
            </div>
            <Link to="/ride/driver/signup" className="btn-primary inline-flex mt-3">
              {language === 'dv' ? 'ރަޖިސްޓަރ' : 'Register'}
            </Link>
          </div>
        ) : null}

        {error ? <div className="text-sm text-red-600">{error}</div> : null}

        {loading ? (
          <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'ލޯޑް ވަނީ...' : 'Loading...'}
          </div>
        ) : activeTrip?.id ? (
          <div className="card p-4">
            <div className="flex items-center justify-between">
              <div>
                <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'އެކްޓިވް ރައިޑް' : 'Active trip'}
                </div>
                <div className="mt-1 font-extrabold text-gray-900">{String(activeTrip.status).toUpperCase()}</div>
              </div>
              <div className="text-right">
                <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{language === 'dv' ? 'އަގު' : 'Fare'}</div>
                <div className="text-xl font-extrabold tabular-nums">{activeTrip.request?.fare}</div>
              </div>
            </div>

            <div className="mt-3 space-y-2 text-sm text-gray-700">
              <div className="flex items-center gap-2">
                <MapPin size={16} className="text-medical-700" />
                <span className="font-semibold">{language === 'dv' ? 'ނަގާ' : 'Pickup'}:</span>
                <span className="truncate">{activeTrip.request?.origin_text}</span>
              </div>
              <div className="flex items-center gap-2">
                <MapPin size={16} className="text-medical-700" />
                <span className="font-semibold">{language === 'dv' ? 'ދާން' : 'Destination'}:</span>
                <span className="truncate">{activeTrip.request?.destination_text}</span>
              </div>
            </div>

            <div className="mt-4 grid grid-cols-2 gap-2">
              {String(activeTrip.status) === 'accepted' ? (
                <button onClick={() => onStatus('arrived')} className="btn-primary justify-center">
                  <CheckCircle2 size={18} /> {language === 'dv' ? 'އަރައިވް' : 'Arrived'}
                </button>
              ) : null}
              {String(activeTrip.status) === 'arrived' ? (
                <button onClick={() => onStatus('started')} className="btn-primary justify-center">
                  <Play size={18} /> {language === 'dv' ? 'ފެށޭ' : 'Start'}
                </button>
              ) : null}

              {String(activeTrip.status) === 'started' ? (
                <button onClick={onFinish} disabled={savingFinish} className="btn-primary justify-center col-span-2">
                  <Flag size={18} /> {savingFinish ? (language === 'dv' ? 'ނިންމަނީ...' : 'Finishing...') : (language === 'dv' ? 'ނިންމާ' : 'Finish & Cash')}
                </button>
              ) : null}
            </div>

            {String(activeTrip.status) === 'started' ? (
              <div className="mt-4 pt-3 border-t space-y-2">
                <div className={`text-sm font-semibold text-gray-800 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ޔޫސަރ ރޭޓް' : 'Rate rider'}
                </div>
                <div className="flex items-center gap-2">
                  <Star size={16} className="text-yellow-500 fill-yellow-500" />
                  <select value={rating} onChange={(e) => setRating(e.target.value)} className="px-3 py-2 rounded-xl border border-gray-200 bg-white">
                    <option value="5">5</option>
                    <option value="4">4</option>
                    <option value="3">3</option>
                    <option value="2">2</option>
                    <option value="1">1</option>
                  </select>
                </div>
                <textarea
                  value={ratingComment}
                  onChange={(e) => setRatingComment(e.target.value)}
                  className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  rows={3}
                  placeholder={language === 'dv' ? 'ކޮމެންޓް...' : 'Comment (optional)'}
                />
              </div>
            ) : null}
          </div>
        ) : canDrive ? (
          <div className="space-y-3">
            <div className="card p-4">
              <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ރައިޑް ރިކުއެސްޓް' : 'Ride requests'}
              </div>
              <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ތިބާގެ ވާހަން އަށް' : `For your vehicle: ${String(profile?.vehicle_type).toUpperCase()}`}
              </div>
            </div>

            {requests.length === 0 ? (
              <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ރިކުއެސްޓެއް ނެތް' : 'No open requests'}
              </div>
            ) : (
              requests.map((r) => (
                <div key={r.id} className="card p-4">
                  <div className="flex items-start justify-between gap-3">
                    <div className="min-w-0">
                      <div className="text-sm text-gray-500">{String(r.vehicle_type).toUpperCase()}</div>
                      <div className="mt-1 font-extrabold text-gray-900 truncate">{r.origin_text}</div>
                      <div className="mt-1 text-sm text-gray-600 truncate">{r.destination_text}</div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-sm text-gray-500">{language === 'dv' ? 'އަގު' : 'Fare'}</div>
                      <div className="text-xl font-extrabold tabular-nums">{r.fare}</div>
                    </div>
                  </div>
                  <button onClick={() => onAccept(r.id)} className="btn-primary w-full justify-center mt-3">
                    <CheckCircle2 size={18} /> {language === 'dv' ? 'އެކްސެޕްޓް' : 'Accept'}
                  </button>
                </div>
              ))
            )}
          </div>
        ) : profile?.id ? (
          <div className="card p-4">
            <div className={`font-bold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'އެޕްރޫވަލް ބޭނުން' : 'Waiting for admin approval'}
            </div>
            <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'އެޑްމިން ހަދާނެ' : 'You can drive after approval'}
            </div>
          </div>
        ) : null}
      </div>
    </div>
  )
}
