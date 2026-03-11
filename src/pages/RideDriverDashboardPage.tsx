import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronLeft, Car, CheckCircle2, MapPin, Play, Flag, Star } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import {
  acceptRideRequest,
  getDriverActiveTrip,
  getDriverOpenRideRequests,
  getMyRideDriverProfile,
  updateDriverTripLocation,
  updateRideTripStatus
} from '../lib/dataService'
import { MapContainer, Marker, Polyline, TileLayer } from 'react-leaflet'

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

  const [myPos, setMyPos] = useState<{ lat: number; lng: number } | null>(null)
  const lastSentRef = useRef<number>(0)
  const [routePoints, setRoutePoints] = useState<Array<[number, number]>>([])

  const [geoOrigin, setGeoOrigin] = useState<{ lat: number; lng: number } | null>(null)
  const [geoDestination, setGeoDestination] = useState<{ lat: number; lng: number } | null>(null)

  const [toast, setToast] = useState<string | null>(null)
  const lastToastRef = useRef<string>('')
  const lastTripStatusRef = useRef<string>('')

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

  const resolvedOrigin = useMemo(() => {
    const lat = activeTrip?.request?.origin_lat
    const lng = activeTrip?.request?.origin_lng
    if (typeof lat === 'number' && typeof lng === 'number') return { lat, lng }
    return geoOrigin
  }, [activeTrip?.request?.origin_lat, activeTrip?.request?.origin_lng, geoOrigin])

  const resolvedDestination = useMemo(() => {
    const lat = activeTrip?.request?.destination_lat
    const lng = activeTrip?.request?.destination_lng
    if (typeof lat === 'number' && typeof lng === 'number') return { lat, lng }
    return geoDestination
  }, [activeTrip?.request?.destination_lat, activeTrip?.request?.destination_lng, geoDestination])

  async function geocodePhoton(text: string): Promise<{ lat: number; lng: number } | null> {
    const q = String(text || '').trim()
    if (q.length < 2) return null
    try {
      const bbox = {
        minLat: 4.10,
        maxLat: 4.27,
        minLng: 73.42,
        maxLng: 73.60
      }
      const url = `https://photon.komoot.io/api/?q=${encodeURIComponent(q)}&limit=1&lat=4.1755&lon=73.5093&bbox=${bbox.minLng},${bbox.minLat},${bbox.maxLng},${bbox.maxLat}`
      const res = await fetch(url)
      if (!res.ok) return null
      const json: any = await res.json()
      const f = Array.isArray(json?.features) ? json.features[0] : null
      const coords = f?.geometry?.coordinates
      const lng = Array.isArray(coords) ? Number(coords[0]) : NaN
      const lat = Array.isArray(coords) ? Number(coords[1]) : NaN
      if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null
      if (lat < bbox.minLat || lat > bbox.maxLat || lng < bbox.minLng || lng > bbox.maxLng) return null
      return { lat, lng }
    } catch {
      return null
    }
  }

  function emitToast(message: string) {
    const msg = String(message || '').trim()
    if (!msg) return
    if (lastToastRef.current === msg) return
    lastToastRef.current = msg
    setToast(msg)
    window.setTimeout(() => {
      setToast((cur) => (cur === msg ? null : cur))
    }, 3500)

    if ('Notification' in window && Notification.permission === 'granted') {
      try {
        new Notification('Medlink Ride', { body: msg })
      } catch {
      }
    }
  }

  useEffect(() => {
    const tripId = activeTrip?.id
    if (!tripId) return
    if (typeof window === 'undefined' || !('geolocation' in navigator)) return

    let stopped = false
    const watchId = navigator.geolocation.watchPosition(
      (pos) => {
        if (stopped) return
        const lat = pos.coords.latitude
        const lng = pos.coords.longitude
        if (!Number.isFinite(lat) || !Number.isFinite(lng)) return
        setMyPos({ lat, lng })

        const now = Date.now()
        if (now - lastSentRef.current < 3000) return
        lastSentRef.current = now
        updateDriverTripLocation(tripId, lat, lng)
      },
      () => {
      },
      { enableHighAccuracy: true, maximumAge: 5000, timeout: 10000 }
    )

    return () => {
      stopped = true
      navigator.geolocation.clearWatch(watchId)
    }
  }, [activeTrip?.id])

  useEffect(() => {
    let cancelled = false
    async function ensureGeocoded() {
      const needsOrigin = !(typeof activeTrip?.request?.origin_lat === 'number' && typeof activeTrip?.request?.origin_lng === 'number')
      const needsDest = !(typeof activeTrip?.request?.destination_lat === 'number' && typeof activeTrip?.request?.destination_lng === 'number')
      if (!needsOrigin) setGeoOrigin(null)
      if (!needsDest) setGeoDestination(null)

      if (needsOrigin) {
        const o = await geocodePhoton(activeTrip?.request?.origin_text || '')
        if (!cancelled) setGeoOrigin(o)
      }
      if (needsDest) {
        const d = await geocodePhoton(activeTrip?.request?.destination_text || '')
        if (!cancelled) setGeoDestination(d)
      }
    }

    if (activeTrip?.id) ensureGeocoded()
    return () => {
      cancelled = true
    }
  }, [activeTrip?.id, activeTrip?.request?.origin_text, activeTrip?.request?.destination_text, activeTrip?.request?.origin_lat, activeTrip?.request?.origin_lng, activeTrip?.request?.destination_lat, activeTrip?.request?.destination_lng])

  useEffect(() => {
    const status = String(activeTrip?.status || '')
    if (!activeTrip?.id || !status) {
      lastTripStatusRef.current = ''
      return
    }

    const prev = lastTripStatusRef.current
    if (!prev) {
      lastTripStatusRef.current = status
      return
    }

    if (prev !== status) {
      lastTripStatusRef.current = status
      if (status === 'arrived') emitToast('You marked ARRIVED')
      if (status === 'started') emitToast('Ride STARTED')
      if (status === 'finished') emitToast('Ride FINISHED')
    }
  }, [activeTrip?.id, activeTrip?.status])

  useEffect(() => {
    async function fetchRoute() {
      const fromLat = resolvedOrigin?.lat
      const fromLng = resolvedOrigin?.lng
      const toLat = resolvedDestination?.lat
      const toLng = resolvedDestination?.lng
      if (typeof fromLat !== 'number' || typeof fromLng !== 'number' || typeof toLat !== 'number' || typeof toLng !== 'number') {
        setRoutePoints([])
        return
      }

      try {
        const url = `https://router.project-osrm.org/route/v1/driving/${fromLng},${fromLat};${toLng},${toLat}?overview=full&geometries=geojson`
        const res = await fetch(url)
        if (!res.ok) throw new Error('Route request failed')
        const json: any = await res.json()
        const coords = json?.routes?.[0]?.geometry?.coordinates
        if (!Array.isArray(coords) || coords.length < 2) throw new Error('No route')
        const pts: Array<[number, number]> = coords
          .map((c: any) => {
            const lng = Array.isArray(c) ? Number(c[0]) : NaN
            const lat = Array.isArray(c) ? Number(c[1]) : NaN
            return [lat, lng] as [number, number]
          })
          .filter(([lat, lng]) => Number.isFinite(lat) && Number.isFinite(lng))

        if (pts.length < 2) throw new Error('No route')
        setRoutePoints(pts)
      } catch {
        setRoutePoints([
          [fromLat, fromLng],
          [toLat, toLng]
        ])
      }
    }

    fetchRoute()
  }, [activeTrip?.id, resolvedOrigin?.lat, resolvedOrigin?.lng, resolvedDestination?.lat, resolvedDestination?.lng])

  async function onAccept(requestId: string) {
    try {
      setLoading(true)
      await acceptRideRequest(requestId)
      await load()
      emitToast('Ride ACCEPTED')
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
        {toast ? (
          <div className="fixed left-1/2 -translate-x-1/2 top-4 z-[2000] bg-gray-900 text-white text-sm px-4 py-2 rounded-2xl shadow-lg">
            {toast}
          </div>
        ) : null}

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

            {resolvedOrigin ? (
              <div className="mt-4 w-full h-64 rounded-xl overflow-hidden">
                <MapContainer
                  center={[resolvedOrigin.lat, resolvedOrigin.lng]}
                  zoom={13}
                  style={{ height: '100%', width: '100%' }}
                  scrollWheelZoom={false}
                >
                  <TileLayer
                    attribution="&copy; OpenStreetMap contributors"
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                  />
                  <Marker position={[resolvedOrigin.lat, resolvedOrigin.lng]} />
                  {resolvedDestination ? (
                    <>
                      <Marker position={[resolvedDestination.lat, resolvedDestination.lng]} />
                      {routePoints.length >= 2 ? <Polyline positions={routePoints} /> : null}
                    </>
                  ) : null}

                  {myPos ? (
                    <Marker position={[myPos.lat, myPos.lng]} />
                  ) : typeof activeTrip.driver_lat === 'number' && typeof activeTrip.driver_lng === 'number' ? (
                    <Marker position={[activeTrip.driver_lat, activeTrip.driver_lng]} />
                  ) : null}
                </MapContainer>
              </div>
            ) : null}

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
