import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { 
  Menu, X, Car, CheckCircle2, MapPin, Play, Flag, Star, LocateFixed, 
  Settings, Wallet, Clock, HelpCircle, LogOut,
  User, Bell, Gift, Users, Calendar, Zap, PhoneCall
} from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import {
  acceptRideRequest,
  getDriverActiveTrip,
  getDriverOpenRideRequests,
  getMyRideDriverProfile,
  markRideTripEnRoute,
  setRideTripDelayReason,
  updateDriverTripLocation,
  updateRideTripStatus
} from '../lib/dataService'
import { MapContainer, Marker, Polyline, TileLayer, useMap } from 'react-leaflet'
import L from 'leaflet'
import BottomSheet from '../components/BottomSheet'

export default function RideDriverDashboardPage() {
  const { language } = useLanguage()
  const [, setLoading] = useState(true)
  const [, setError] = useState<string | null>(null)

  const [profile, setProfile] = useState<any>(null)
  const [requests, setRequests] = useState<any[]>([])
  const [activeTrip, setActiveTrip] = useState<any>(null)
  const [drawerOpen, setDrawerOpen] = useState(false)
  const [isOnline, setIsOnline] = useState(true)
  const [onlineTime] = useState('1h 44m')
  const [stats] = useState({ trips: 315, rating: 4.9, days: 272, earnings: 0, completedToday: 0 })

  const navigate = useNavigate()

  const [rating, setRating] = useState('5')
  const [ratingComment, setRatingComment] = useState('')
  const [savingFinish, setSavingFinish] = useState(false)

  const [myPos, setMyPos] = useState<{ lat: number; lng: number } | null>(null)
  const [, setMyAccuracy] = useState<number | null>(null)
  const lastSentRef = useRef<number>(0)
  const lastSentPosRef = useRef<{ lat: number; lng: number } | null>(null)
  const [routePoints, setRoutePoints] = useState<Array<[number, number]>>([])

  const [geoOrigin, setGeoOrigin] = useState<{ lat: number; lng: number } | null>(null)
  const [geoDestination, setGeoDestination] = useState<{ lat: number; lng: number } | null>(null)

  const [toast, setToast] = useState<string | null>(null)
  const lastToastRef = useRef<string>('')
  const lastTripStatusRef = useRef<string>('')
  const [, setLastLocationSentAt] = useState<number | null>(null)

  const [pickupEtaSeconds, setPickupEtaSeconds] = useState<number | null>(null)
  const askedDelayRef = useRef(false)

  const mapRef = useRef<L.Map | null>(null)
  const [followMe, setFollowMe] = useState(true)
  const hasFittedRef = useRef(false)

  function distanceMeters(a: { lat: number; lng: number }, b: { lat: number; lng: number }) {
    const R = 6371000
    const dLat = ((b.lat - a.lat) * Math.PI) / 180
    const dLng = ((b.lng - a.lng) * Math.PI) / 180
    const lat1 = (a.lat * Math.PI) / 180
    const lat2 = (b.lat * Math.PI) / 180
    const s1 = Math.sin(dLat / 2)
    const s2 = Math.sin(dLng / 2)
    const h = s1 * s1 + Math.cos(lat1) * Math.cos(lat2) * s2 * s2
    return 2 * R * Math.asin(Math.min(1, Math.sqrt(h)))
  }

  function MapRefCapture() {
    const map = useMap()
    useEffect(() => {
      mapRef.current = map
      map.on('dragstart', () => setFollowMe(false))
      map.on('zoomstart', () => setFollowMe(false))
      return () => {
        map.off('dragstart')
        map.off('zoomstart')
      }
    }, [map])
    return null
  }

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

  async function onEnRoute() {
    if (!activeTrip?.id) return
    try {
      setLoading(true)
      const ok = await markRideTripEnRoute(activeTrip.id)
      await load()
      if (ok) emitToast(language === 'dv' ? 'ނަގާ ތަނަށް ދަންނަވަނީ' : 'On the way to pickup')
      const openNav = window.confirm(language === 'dv' ? 'Google Maps އެކަށައިގެން ނަގާ ތަނަށް ދަންނަވާ؟' : 'Open Google Maps directions to pickup?')
      if (openNav) {
        openGoogleMapsDirections({
          lat: resolvedOrigin?.lat ?? null,
          lng: resolvedOrigin?.lng ?? null,
          text: activeTrip?.request?.origin_text || ''
        })
      }
    } catch (err: any) {
      setError(err?.message || 'Failed to update')
      setLoading(false)
    }
  }

  const pickupIcon = useMemo(() => {
    const svg = `
      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
        <circle cx="18" cy="18" r="16" fill="#0f766e" stroke="white" stroke-width="3" />
        <circle cx="18" cy="14" r="4" fill="white" />
        <path d="M10 28c1.5-5 14.5-5 16 0" fill="none" stroke="white" stroke-width="3" stroke-linecap="round" />
      </svg>
    `.trim()

    return L.divIcon({ html: svg, className: '', iconSize: [36, 36], iconAnchor: [18, 18] })
  }, [])

  const driverIcon = useMemo(() => {
    const type = String(profile?.vehicle_type || '').toLowerCase()
    const isBike = type === 'bike'
    const color = isBike ? '#1d4ed8' : '#7c3aed'
    const glyph = isBike ?
      '<path d="M12 22a4 4 0 1 0 0 8a4 4 0 0 0 0-8Zm0 2a2 2 0 1 1 0 4a2 2 0 0 1 0-4Zm14-2a4 4 0 1 0 0 8a4 4 0 0 0 0-8Zm0 2a2 2 0 1 1 0 4a2 2 0 0 1 0-4ZM14 12h4l3 6h-3l-2-4h-1l-3 8h-2l4-10Z" fill="white"/>'
      : '<path d="M10 22h16l2 4v6h-2a2 2 0 1 1-4 0H14a2 2 0 1 1-4 0H8v-6l2-4Zm2 2-1 2h18l-1-2H12Z" fill="white"/>'

    const svg = `
      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
        <circle cx="18" cy="18" r="16" fill="${color}" stroke="white" stroke-width="3" />
        ${glyph}
      </svg>
    `.trim()

    return L.divIcon({ html: svg, className: '', iconSize: [36, 36], iconAnchor: [18, 18] })
  }, [profile?.vehicle_type])

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
      async (pos) => {
        if (stopped) return
        const lat = pos.coords.latitude
        const lng = pos.coords.longitude
        const acc = typeof pos.coords.accuracy === 'number' ? pos.coords.accuracy : null
        if (!Number.isFinite(lat) || !Number.isFinite(lng)) return
        setMyPos({ lat, lng })
        setMyAccuracy(acc)

        if (typeof acc === 'number' && acc > 150) {
          return
        }

        const now = Date.now()
        if (now - lastSentRef.current < 5000) return

        const nextPos = { lat, lng }
        const lastPos = lastSentPosRef.current
        if (lastPos) {
          const moved = distanceMeters(lastPos, nextPos)
          if (moved < 15) return
        }
        lastSentRef.current = now
        lastSentPosRef.current = nextPos
        const ok = await updateDriverTripLocation(tripId, lat, lng)
        if (ok) {
          setLastLocationSentAt(Date.now())
        } else {
          emitToast(language === 'dv' ? 'ލޮކޭޝަން ސެންޑް ނުކުރެވުނު' : 'Failed to send location')
        }
      },
      () => {
      },
      { enableHighAccuracy: true, maximumAge: 0, timeout: 20000 }
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

  useEffect(() => {
    if (!resolvedOrigin) {
      hasFittedRef.current = false
      return
    }

    if (routePoints.length >= 2 && !hasFittedRef.current) {
      hasFittedRef.current = true
      mapRef.current?.fitBounds(routePoints as any, { padding: [30, 30] } as any)
    }
  }, [resolvedOrigin, routePoints])

  useEffect(() => {
    if (!followMe) return
    const lat = myPos?.lat
    const lng = myPos?.lng
    if (typeof lat !== 'number' || typeof lng !== 'number') return
    mapRef.current?.setView([lat, lng], Math.max(mapRef.current?.getZoom?.() || 13, 15), { animate: true } as any)
  }, [followMe, myPos?.lat, myPos?.lng])

  useEffect(() => {
    askedDelayRef.current = false
    setPickupEtaSeconds(null)
  }, [activeTrip?.id])

  useEffect(() => {
    async function fetchPickupEta() {
      if (!activeTrip?.id) return
      if (String(activeTrip.status) !== 'accepted') return
      if (!myPos || !resolvedOrigin) return
      if (typeof myPos.lat !== 'number' || typeof myPos.lng !== 'number') return

      try {
        const url = `https://router.project-osrm.org/route/v1/driving/${myPos.lng},${myPos.lat};${resolvedOrigin.lng},${resolvedOrigin.lat}?overview=false`
        const res = await fetch(url)
        if (!res.ok) return
        const json: any = await res.json()
        const seconds = Number(json?.routes?.[0]?.duration)
        if (!Number.isFinite(seconds) || seconds <= 0) return
        setPickupEtaSeconds(seconds)
      } catch {
      }
    }

    fetchPickupEta()
    const t = window.setInterval(fetchPickupEta, 30_000)
    return () => window.clearInterval(t)
  }, [activeTrip?.id, activeTrip?.status, myPos?.lat, myPos?.lng, resolvedOrigin?.lat, resolvedOrigin?.lng])

  useEffect(() => {
    async function checkLate() {
      if (!activeTrip?.id) return
      if (String(activeTrip.status) !== 'accepted') return
      if (activeTrip.delay_reason) return
      if (askedDelayRef.current) return

      const acceptedAtMs = activeTrip.accepted_at ? Date.parse(activeTrip.accepted_at) : NaN
      if (!Number.isFinite(acceptedAtMs)) return

      const elapsedMs = Date.now() - acceptedAtMs

      const etaMs = typeof pickupEtaSeconds === 'number' ? pickupEtaSeconds * 1000 : 10 * 60 * 1000
      const thresholdMs = etaMs * 2 + 5 * 60 * 1000

      if (elapsedMs < thresholdMs) return

      askedDelayRef.current = true
      const reason = window.prompt(
        language === 'dv'
          ? 'ނަގާ ތަނަށް ދަންނަވާއިރު ލަސް ކަމަށް ވެފައިވޭ. ސަބަބެއް ލިޔެލާށެވެ:'
          : 'Your arrival is taking longer than expected. Please type the reason (this will be shown to the user):'
      )

      const msg = String(reason || '').trim()
      if (!msg) return

      await setRideTripDelayReason(activeTrip.id, msg)
      await load()
      emitToast(language === 'dv' ? 'ލަސް ކަމުގެ ސަބަބު ރަޖިސްޓްރީ ކުރެވިއްޖެ' : 'Delay reason sent to user')
    }

    checkLate()
    const t = window.setInterval(checkLate, 10_000)
    return () => window.clearInterval(t)
  }, [activeTrip?.id, activeTrip?.status, activeTrip?.accepted_at, activeTrip?.delay_reason, pickupEtaSeconds, language])

  function openGoogleMapsDirections(dest: { lat?: number | null; lng?: number | null; text?: string | null }) {
    const lat = dest?.lat
    const lng = dest?.lng
    const text = String(dest?.text || '').trim()

    let url = ''
    if (typeof lat === 'number' && typeof lng === 'number') {
      url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=driving`
    } else if (text) {
      url = `https://www.google.com/maps/dir/?api=1&destination=${encodeURIComponent(text)}&travelmode=driving`
    }

    if (!url) return
    window.open(url, '_blank', 'noopener,noreferrer')
  }

  async function onAccept(requestId: string) {
    try {
      setLoading(true)
      const trip = await acceptRideRequest(requestId)
      await load()

      if (trip?.id && typeof window !== 'undefined' && 'geolocation' in navigator) {
        try {
          navigator.geolocation.getCurrentPosition(
            (pos) => {
              const lat = pos.coords.latitude
              const lng = pos.coords.longitude
              if (!Number.isFinite(lat) || !Number.isFinite(lng)) return
              setMyPos({ lat, lng })
              updateDriverTripLocation(String(trip.id), lat, lng).then((ok) => {
                if (ok) setLastLocationSentAt(Date.now())
              })
            },
            () => {
            },
            { enableHighAccuracy: true, maximumAge: 0, timeout: 8000 }
          )
        } catch {
        }
      }
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

      if (next === 'arrived') {
        const ok = window.confirm(language === 'dv' ? 'Google Maps އެކަށައިގެން ނަގާ ތަނަށް ދަންނަވާ؟' : 'Open Google Maps directions to pickup?')
        if (ok) {
          openGoogleMapsDirections({
            lat: resolvedOrigin?.lat ?? null,
            lng: resolvedOrigin?.lng ?? null,
            text: activeTrip?.request?.origin_text || ''
          })
        }
      }

      if (next === 'started') {
        const ok = window.confirm(language === 'dv' ? 'Google Maps އެކަށައިގެން ދާން ތަނަށް ދަންނަވާ؟' : 'Open Google Maps navigation to destination?')
        if (ok) {
          openGoogleMapsDirections({
            lat: resolvedDestination?.lat ?? null,
            lng: resolvedDestination?.lng ?? null,
            text: activeTrip?.request?.destination_text || ''
          })
        }
      }
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

  const mapCenter = useMemo<[number, number]>(() => {
    if (myPos) return [myPos.lat, myPos.lng]
    return [4.1755, 73.5093]
  }, [myPos])

  if (!profile?.id) {
    return (
      <div className="min-h-screen bg-gray-50">
        <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
          <div className="flex items-center gap-3">
            <button onClick={() => navigate('/ride')} className="w-10 h-10 bg-white/10 rounded-xl flex items-center justify-center">
              <X size={20} />
            </button>
            <h1 className="text-xl font-bold">{language === 'dv' ? 'ޑްރައިވަރު' : 'Driver'}</h1>
          </div>
        </div>
        <div className="p-4">
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <p className="text-gray-600">{language === 'dv' ? 'ޑްރައިވަރު ޕްރޮފައިލެއް ނެތް' : 'No driver profile found'}</p>
            <Link to="/ride/driver/signup" className="mt-3 inline-flex items-center px-4 py-2 bg-medical-600 text-white rounded-xl font-medium">
              {language === 'dv' ? 'ރަޖިސްޓަރީ' : 'Register as Driver'}
            </Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 relative overflow-hidden">
      {/* Toast */}
      {toast && (
        <div className="fixed left-1/2 -translate-x-1/2 top-4 z-[2000] bg-gray-900 text-white text-sm px-4 py-2 rounded-2xl shadow-lg">
          {toast}
        </div>
      )}

      {/* Side Drawer */}
      {drawerOpen && (
        <>
          <div className="fixed inset-0 bg-black/50 z-[1500]" onClick={() => setDrawerOpen(false)} />
          <div className={`fixed top-0 h-full w-[280px] bg-white z-[1600] shadow-2xl ${language === 'dv' ? 'right-0' : 'left-0'}`}>
            <div className="p-4 border-b">
              <div className="flex items-center gap-3">
                <div className="w-14 h-14 rounded-full bg-gray-200 overflow-hidden">
                  {profile?.driver_image_path ? (
                    <img src={`${import.meta.env.VITE_SUPABASE_URL}/storage/v1/object/public/driver-documents/${profile.driver_image_path}`} alt="" className="w-full h-full object-cover" />
                  ) : (
                    <div className="w-full h-full bg-medical-100 flex items-center justify-center"><User size={24} className="text-medical-600" /></div>
                  )}
                </div>
                <div>
                  <h3 className="font-bold text-gray-900">{profile?.full_name || 'Driver'}</h3>
                  <div className="flex items-center gap-1 text-sm text-gray-500">
                    <Star size={14} className="text-yellow-500 fill-yellow-500" />
                    <span>{stats.rating.toFixed(1)}</span>
                  </div>
                </div>
              </div>
            </div>
            <div className="py-2">
              <MenuItem icon={<Car size={20} />} label={language === 'dv' ? 'ޑްރައިވާ' : 'Drive'} active onClick={() => setDrawerOpen(false)} />
              <MenuItem icon={<Clock size={20} />} label={language === 'dv' ? 'ޓްރިޕްސް' : 'Trips'} onClick={() => { navigate('/ride/history'); setDrawerOpen(false) }} />
              <MenuItem icon={<Wallet size={20} />} label={language === 'dv' ? 'ވޮލެޓް' : 'Wallet'} onClick={() => setDrawerOpen(false)} />
              <MenuItem icon={<Calendar size={20} />} label={language === 'dv' ? 'ޝެޑިއުލްޑް ޓްރިޕްސް' : 'Scheduled Trips'} onClick={() => setDrawerOpen(false)} />
              <div className="border-t my-2" />
              <MenuItem icon={<Gift size={20} />} label={language === 'dv' ? 'ޕްރޮމޯޝަންސް' : 'Promotions'} onClick={() => setDrawerOpen(false)} />
              <MenuItem icon={<Users size={20} />} label={language === 'dv' ? 'މައި ރެފެރަލްސް' : 'My Referrals'} onClick={() => setDrawerOpen(false)} />
              <MenuItem icon={<Bell size={20} />} label={language === 'dv' ? 'ނޮޓިފިކޭޝަންސް' : 'Notifications'} onClick={() => setDrawerOpen(false)} />
              <div className="border-t my-2" />
              <MenuItem icon={<PhoneCall size={20} />} label={language === 'dv' ? 'ކޯލް ފޯރ ހެލްޕް' : 'Call for help'} onClick={() => window.location.href = 'tel:999'} />
              <MenuItem icon={<HelpCircle size={20} />} label={language === 'dv' ? 'ސަޕޯރޓް' : 'Support'} onClick={() => setDrawerOpen(false)} />
            </div>
            <div className="absolute bottom-0 left-0 right-0 p-4 border-t">
              <button onClick={() => setDrawerOpen(false)} className="flex items-center gap-3 w-full px-3 py-2 text-gray-600 hover:bg-gray-50 rounded-xl">
                <LogOut size={20} />
                <span className="font-medium">{language === 'dv' ? 'ލޮގް އައުޓް' : 'Log Out'}</span>
              </button>
            </div>
          </div>
        </>
      )}

      {/* Main Content */}
      <div className="absolute inset-0 flex flex-col">
        {/* Header Stats Bar */}
        <div className="bg-white px-4 pt-12 pb-3 shadow-sm z-[1000]">
          <div className="flex items-center justify-between">
            <button onClick={() => setDrawerOpen(true)} className="w-10 h-10 bg-gray-100 rounded-xl flex items-center justify-center">
              <Menu size={20} className="text-gray-700" />
            </button>
            <div className="flex items-center gap-4">
              <div className="text-center">
                <div className="text-xs text-gray-500">{language === 'dv' ? 'އާނިންގްސް' : 'Earnings'}</div>
                <div className="font-bold text-gray-900">ރ{stats.earnings}</div>
              </div>
              <div className="text-center">
                <div className="text-xs text-gray-500">{language === 'dv' ? 'ޓްރިޕްސް' : 'Trips'}</div>
                <div className="font-bold text-gray-900">{stats.completedToday}</div>
              </div>
              <div className="flex items-center gap-1 bg-gray-100 px-3 py-1 rounded-full">
                <div className={`w-2 h-2 rounded-full ${isOnline ? 'bg-green-500 animate-pulse' : 'bg-gray-400'}`} />
                <span className="text-sm font-medium text-gray-700">{isOnline ? onlineTime : 'Offline'}</span>
              </div>
            </div>
            <button onClick={() => navigate('/ride')} className="w-10 h-10 bg-gray-100 rounded-xl flex items-center justify-center">
              <X size={20} className="text-gray-700" />
            </button>
          </div>
        </div>

        {/* Map Container */}
        <div className="flex-1 relative">
          <MapContainer center={mapCenter} zoom={14} style={{ height: '100%', width: '100%' }} zoomControl={false}>
            <MapRefCapture />
            <TileLayer attribution="&copy; OpenStreetMap" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
            {myPos && <Marker position={[myPos.lat, myPos.lng]} icon={driverIcon} />}
            {resolvedOrigin && <Marker position={[resolvedOrigin.lat, resolvedOrigin.lng]} icon={pickupIcon} />}
            {resolvedDestination && <Marker position={[resolvedDestination.lat, resolvedDestination.lng]} />}
            {routePoints.length >= 2 && <Polyline positions={routePoints} color="#0f766e" />}
          </MapContainer>
          <div className="absolute right-4 top-4 z-[1000] flex flex-col gap-2">
            <button onClick={() => setFollowMe(true)} className="w-12 h-12 bg-white rounded-full shadow-lg flex items-center justify-center">
              <LocateFixed size={20} className="text-gray-700" />
            </button>
          </div>
          <div className="absolute bottom-32 left-1/2 -translate-x-1/2 z-[1000]">
            <button onClick={() => setIsOnline(!isOnline)} className={`flex items-center gap-2 px-6 py-3 rounded-full font-bold shadow-lg transition-all ${isOnline ? 'bg-green-500 text-white shadow-green-500/40' : 'bg-gray-800 text-white'}`}>
              <Zap size={20} className={isOnline ? 'fill-white' : ''} />
              {isOnline ? (language === 'dv' ? 'އޮންލައިން' : 'Online') : (language === 'dv' ? 'އޮފްލައިން' : 'Go Online')}
            </button>
          </div>
        </div>

        {/* Bottom Sheet */}
        <BottomSheet open={true} disableBackdropClose initialSnap={0.4} snapPoints={[0.25, 0.4, 0.7]}>
          <div className="space-y-4">
            {!activeTrip?.id && isOnline && (
              <div>
                <div className="flex items-center gap-3 mb-4">
                  <div className="w-10 h-10 rounded-full bg-medical-50 flex items-center justify-center">
                    <Settings size={20} className="text-medical-600" />
                  </div>
                  <span className="font-semibold text-gray-900">{language === 'dv' ? 'ރައިޑް ރިކުއެސްޓްސް ހޯދަނީ...' : 'Finding ride requests...'}</span>
                </div>
                {requests.length > 0 ? (
                  <div className="space-y-3">
                    {requests.map((r) => (
                      <div key={r.id} className="bg-gray-50 rounded-xl p-3">
                        <div className="flex items-start justify-between">
                          <div className="flex-1 min-w-0">
                            <div className="flex items-center gap-2">
                              <MapPin size={14} className="text-medical-600" />
                              <span className="text-sm font-medium text-gray-900 truncate">{r.origin_text}</span>
                            </div>
                            <div className="flex items-center gap-2 mt-1 ml-5">
                              <MapPin size={14} className="text-gray-400" />
                              <span className="text-sm text-gray-500 truncate">{r.destination_text}</span>
                            </div>
                          </div>
                          <div className="text-right">
                            <div className="text-lg font-bold text-gray-900">ރ{r.fare}</div>
                            <div className="text-xs text-gray-500">{String(r.vehicle_type).toUpperCase()}</div>
                          </div>
                        </div>
                        <button onClick={() => onAccept(r.id)} className="w-full mt-3 py-2 bg-medical-600 text-white rounded-xl font-medium">{language === 'dv' ? 'އެކްސެޕްޓް' : 'Accept'}</button>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="text-center py-8 text-gray-500">{language === 'dv' ? 'ރިކުއެސްޓްސް ނެތް' : 'No requests nearby'}</div>
                )}
              </div>
            )}
            {activeTrip?.id && (
              <div>
                <div className="flex items-center justify-between mb-4">
                  <div>
                    <div className="text-sm text-gray-500">{language === 'dv' ? 'އެކްޓިވް ޓްރިޕް' : 'Active Trip'}</div>
                    <div className="text-lg font-bold text-gray-900">{String(activeTrip.status).toUpperCase()}</div>
                  </div>
                  <div className="text-2xl font-bold text-gray-900">ރ{activeTrip.request?.fare}</div>
                </div>
                <div className="space-y-2 mb-4">
                  <div className="flex items-center gap-2"><MapPin size={16} className="text-medical-600" /><span className="text-sm font-medium">{activeTrip.request?.origin_text}</span></div>
                  <div className="flex items-center gap-2"><MapPin size={16} className="text-gray-400" /><span className="text-sm text-gray-600">{activeTrip.request?.destination_text}</span></div>
                </div>
                <div className="flex gap-2">
                  {String(activeTrip.status) === 'accepted' && !activeTrip?.en_route_at && (
                    <button onClick={onEnRoute} className="flex-1 py-3 bg-blue-600 text-white rounded-xl font-medium flex items-center justify-center gap-2"><Car size={18} />{language === 'dv' ? 'އެން ރޫޓް' : 'En Route'}</button>
                  )}
                  {String(activeTrip.status) === 'accepted' && activeTrip?.en_route_at && (
                    <button onClick={() => onStatus('arrived')} className="flex-1 py-3 bg-medical-600 text-white rounded-xl font-medium flex items-center justify-center gap-2"><CheckCircle2 size={18} />{language === 'dv' ? 'އަރައިވްޑް' : 'Arrived'}</button>
                  )}
                  {String(activeTrip.status) === 'arrived' && (
                    <button onClick={() => onStatus('started')} className="flex-1 py-3 bg-green-600 text-white rounded-xl font-medium flex items-center justify-center gap-2"><Play size={18} />{language === 'dv' ? 'ސްޓާޓް' : 'Start Trip'}</button>
                  )}
                  {String(activeTrip.status) === 'started' && (
                    <button onClick={onFinish} disabled={savingFinish} className="flex-1 py-3 bg-gray-900 text-white rounded-xl font-medium flex items-center justify-center gap-2"><Flag size={18} />{savingFinish ? (language === 'dv' ? 'ފިނިޝިންގ...' : 'Finishing...') : (language === 'dv' ? 'ފިނިޝް' : 'Finish')}</button>
                  )}
                </div>
                {String(activeTrip.status) === 'started' && (
                  <div className="mt-4 pt-4 border-t">
                    <div className="text-sm font-medium text-gray-700 mb-2">{language === 'dv' ? 'ރޭޓް ރައިޑަރު' : 'Rate Rider'}</div>
                    <div className="flex items-center gap-2 mb-2">
                      <Star size={16} className="text-yellow-500 fill-yellow-500" />
                      <select value={rating} onChange={(e) => setRating(e.target.value)} className="px-3 py-1 rounded-lg border border-gray-200">{[5,4,3,2,1].map(n => <option key={n} value={n}>{n}</option>)}</select>
                    </div>
                    <textarea value={ratingComment} onChange={(e) => setRatingComment(e.target.value)} placeholder={language === 'dv' ? 'ކޮމެންޓް...' : 'Comment (optional)'} className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm" rows={2} />
                  </div>
                )}
              </div>
            )}
            {!isOnline && !activeTrip?.id && (
              <div className="text-center py-8">
                <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-3"><Zap size={24} className="text-gray-400" /></div>
                <p className="text-gray-500">{language === 'dv' ? 'އޮންލައިން ވެއްޖެން ރިކުއެސްޓްސް ދައްކާ' : 'Go online to see requests'}</p>
              </div>
            )}
          </div>
        </BottomSheet>

        {/* Bottom Stats Bar */}
        <div className="bg-white border-t px-4 py-3 z-[1000]">
          <div className="flex items-center justify-around">
            <div className="text-center">
              <div className="text-xs text-gray-500">{language === 'dv' ? 'ކޮމްޕްލީޓް' : 'Completed'}</div>
              <div className="font-bold text-gray-900">{stats.completedToday}</div>
            </div>
            <div className="w-px h-8 bg-gray-200" />
            <div className="text-center">
              <div className="text-xs text-gray-500">{language === 'dv' ? 'ޓުޑޭސް' : 'Earnings'}</div>
              <div className="font-bold text-gray-900">ރ{stats.earnings}</div>
            </div>
            <div className="w-px h-8 bg-gray-200" />
            <div className="text-center">
              <div className="text-xs text-gray-500">{language === 'dv' ? 'ޓައިމް' : 'Time'}</div>
              <div className="font-bold text-gray-900">{onlineTime}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

function MenuItem({ icon, label, active, onClick }: { icon: React.ReactNode; label: string; active?: boolean; onClick: () => void }) {
  return (
    <button onClick={onClick} className={`flex items-center gap-3 w-full px-4 py-3 text-left transition-colors ${active ? 'bg-medical-50 text-medical-600' : 'text-gray-700 hover:bg-gray-50'}`}>
      {icon}
      <span className="font-medium">{label}</span>
    </button>
  )
}
