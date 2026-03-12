import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronLeft, Car, X, LocateFixed } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { cancelMyOpenRideRequest, getMyLatestRideState } from '../lib/dataService'
import { MapContainer, Marker, Polyline, TileLayer, useMap } from 'react-leaflet'
import { supabase } from '../lib/supabase'
import L from 'leaflet'

export default function RideStatusPage() {
  const { language } = useLanguage()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [state, setState] = useState<any>(null)
  const [cancelling, setCancelling] = useState(false)
  const [routePoints, setRoutePoints] = useState<Array<[number, number]>>([])
  const [geoOrigin, setGeoOrigin] = useState<{ lat: number; lng: number } | null>(null)
  const [geoDestination, setGeoDestination] = useState<{ lat: number; lng: number } | null>(null)
  const [toast, setToast] = useState<string | null>(null)
  const lastToastRef = useRef<string>('')
  const lastStatusRef = useRef<string>('')
  const lastEnRouteRef = useRef<string>('')

  const mapRef = useRef<L.Map | null>(null)
  const [followDriver, setFollowDriver] = useState(true)
  const hasFittedRef = useRef(false)

  useEffect(() => {
    load()
    const t = window.setInterval(load, 5000)
    return () => window.clearInterval(t)
  }, [])

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

  function MapRefCapture() {
    const map = useMap()
    useEffect(() => {
      mapRef.current = map
      map.on('dragstart', () => setFollowDriver(false))
      map.on('zoomstart', () => setFollowDriver(false))
      return () => {
        map.off('dragstart')
        map.off('zoomstart')
      }
    }, [map])
    return null
  }

  async function load() {
    try {
      setError(null)
      const s = await getMyLatestRideState()
      setState(s)
    } catch (err: any) {
      setError(err?.message || 'Failed to load ride status')
    } finally {
      setLoading(false)
    }
  }

  const summary = useMemo(() => {
    const req = state?.request
    const trip = state?.trip
    if (!req) return null

    const status = trip?.status || req?.status || 'open'
    return {
      origin: req.origin_text,
      destination: req.destination_text,
      originLat: req.origin_lat,
      originLng: req.origin_lng,
      destinationLat: req.destination_lat,
      destinationLng: req.destination_lng,
      vehicleType: req.vehicle_type,
      fare: req.fare,
      status,
      driverName: trip?.driver?.full_name || null,
      driverPhone: trip?.driver?.phone || null,
      vehicleNumber: trip?.driver?.vehicle_number || null,
      tripId: trip?.id || null,
      enRouteAt: trip?.en_route_at || null,
      driverLat: trip?.driver_lat,
      driverLng: trip?.driver_lng
    }
  }, [state])

  useEffect(() => {
    const s = String(summary?.status || '')
    if (!s) {
      lastStatusRef.current = ''
      return
    }

    const prev = lastStatusRef.current
    if (!prev) {
      lastStatusRef.current = s
      return
    }

    if (prev !== s) {
      lastStatusRef.current = s
      if (s === 'accepted') emitToast('Driver accepted your ride')
      if (s === 'arrived') emitToast('Driver arrived at pickup')
      if (s === 'finished') emitToast('Ride finished')
    }
  }, [summary?.status])

  useEffect(() => {
    const cur = summary?.enRouteAt
    const v = cur ? String(cur) : ''
    const tripId = summary?.tripId
    if (!tripId) {
      lastEnRouteRef.current = ''
      return
    }

    if (!lastEnRouteRef.current) {
      lastEnRouteRef.current = v
      return
    }

    if (!lastEnRouteRef.current && v) {
      lastEnRouteRef.current = v
      emitToast(language === 'dv' ? 'ޑްރައިވަރު ނަގާ ތަނަށް ދަންނަވަނީ' : 'Driver is on the way to pickup')
      return
    }

    lastEnRouteRef.current = v
  }, [summary?.tripId, summary?.enRouteAt, language])

  const resolvedOrigin = useMemo(() => {
    if (typeof summary?.originLat === 'number' && typeof summary?.originLng === 'number') {
      return { lat: summary.originLat, lng: summary.originLng }
    }
    return geoOrigin
  }, [geoOrigin, summary?.originLat, summary?.originLng])

  const resolvedDestination = useMemo(() => {
    if (typeof summary?.destinationLat === 'number' && typeof summary?.destinationLng === 'number') {
      return { lat: summary.destinationLat, lng: summary.destinationLng }
    }
    return geoDestination
  }, [geoDestination, summary?.destinationLat, summary?.destinationLng])

  const pickupIcon = useMemo(() => {
    const svg = `
      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
        <circle cx="18" cy="18" r="16" fill="#0f766e" stroke="white" stroke-width="3" />
        <circle cx="18" cy="14" r="4" fill="white" />
        <path d="M10 28c1.5-5 14.5-5 16 0" fill="none" stroke="white" stroke-width="3" stroke-linecap="round" />
      </svg>
    `.trim()

    return L.divIcon({
      html: svg,
      className: '',
      iconSize: [36, 36],
      iconAnchor: [18, 18]
    })
  }, [])

  const driverIcon = useMemo(() => {
    const type = String(summary?.vehicleType || '').toLowerCase()
    const isBike = type === 'bike'
    const color = isBike ? '#1d4ed8' : '#7c3aed'
    const glyph = isBike
      ? `<path d="M12 22a4 4 0 1 0 0 8a4 4 0 0 0 0-8Zm0 2a2 2 0 1 1 0 4a2 2 0 0 1 0-4Zm14-2a4 4 0 1 0 0 8a4 4 0 0 0 0-8Zm0 2a2 2 0 1 1 0 4a2 2 0 0 1 0-4ZM14 12h4l3 6h-3l-2-4h-1l-3 8h-2l4-10Z" fill="white"/>`
      : `<path d="M10 22h16l2 4v6h-2a2 2 0 1 1-4 0H14a2 2 0 1 1-4 0H8v-6l2-4Zm2 2-1 2h18l-1-2H12Z" fill="white"/>`

    const svg = `
      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
        <circle cx="18" cy="18" r="16" fill="${color}" stroke="white" stroke-width="3" />
        ${glyph}
      </svg>
    `.trim()

    return L.divIcon({
      html: svg,
      className: '',
      iconSize: [36, 36],
      iconAnchor: [18, 18]
    })
  }, [summary?.vehicleType])

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

  useEffect(() => {
    const tripId = summary?.tripId
    if (!tripId) return

    const channel = supabase
      .channel(`ride_trip:${tripId}`)
      .on(
        'postgres_changes',
        {
          event: 'UPDATE',
          schema: 'public',
          table: 'ride_trips',
          filter: `id=eq.${tripId}`
        },
        () => {
          load()
        }
      )
      .subscribe()

    return () => {
      supabase.removeChannel(channel)
    }
  }, [summary?.tripId])

  useEffect(() => {
    let cancelled = false
    async function ensureGeocoded() {
      if (!summary?.origin || !summary?.destination) {
        setGeoOrigin(null)
        setGeoDestination(null)
        return
      }

      const needsOrigin = !(typeof summary.originLat === 'number' && typeof summary.originLng === 'number')
      const needsDest = !(typeof summary.destinationLat === 'number' && typeof summary.destinationLng === 'number')

      if (!needsOrigin) setGeoOrigin(null)
      if (!needsDest) setGeoDestination(null)

      if (needsOrigin) {
        const o = await geocodePhoton(summary.origin)
        if (!cancelled) setGeoOrigin(o)
      }

      if (needsDest) {
        const d = await geocodePhoton(summary.destination)
        if (!cancelled) setGeoDestination(d)
      }
    }

    ensureGeocoded()
    return () => {
      cancelled = true
    }
  }, [summary?.origin, summary?.destination, summary?.originLat, summary?.originLng, summary?.destinationLat, summary?.destinationLng])

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
  }, [resolvedOrigin?.lat, resolvedOrigin?.lng, resolvedDestination?.lat, resolvedDestination?.lng])

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
    if (!followDriver) return
    const lat = summary?.driverLat
    const lng = summary?.driverLng
    if (typeof lat !== 'number' || typeof lng !== 'number') return
    mapRef.current?.setView([lat, lng], Math.max(mapRef.current?.getZoom?.() || 13, 15), { animate: true } as any)
  }, [followDriver, summary?.driverLat, summary?.driverLng])

  async function onCancel() {
    setCancelling(true)
    try {
      await cancelMyOpenRideRequest()
      await load()
    } finally {
      setCancelling(false)
    }
  }

  return (
    <div className={`min-h-screen pb-24 ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      {toast ? (
        <div className="fixed left-1/2 -translate-x-1/2 top-4 z-[2000] bg-gray-900 text-white text-sm px-4 py-2 rounded-2xl shadow-lg">
          {toast}
        </div>
      ) : null}

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
            {language === 'dv' ? 'ރައިޑް ސްޓޭޓަސް' : 'My Ride Status'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
            <Car size={22} className="text-white" />
          </div>
          <div className="min-w-0">
            <div className={`text-white text-lg font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'އަދި އަލަށް އަންނަނީ' : 'Updates every few seconds'}
            </div>
            <div className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ޑްރައިވަރު އެކްސެޕްޓް ކުރަން ނުވަތަ' : 'Wait for a driver to accept'}
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 mt-5">
        {loading ? (
          <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'ލޯޑް ވަނީ...' : 'Loading...'}
          </div>
        ) : error ? (
          <div className="text-sm text-red-600">{error}</div>
        ) : !summary ? (
          <div className="card p-4">
            <div className={`font-bold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރައިޑް ރިކުއެސްޓެއް ނެތް' : 'No active ride request'}
            </div>
            <div className="mt-2">
              <Link to="/ride/book" className="btn-primary inline-flex">
                {language === 'dv' ? 'ރައިޑް ހޯދާ' : 'Book a Ride'}
              </Link>
            </div>
          </div>
        ) : (
          <div className="space-y-3">
            <div className="card p-4">
              <div className="text-sm text-gray-600">
                {language === 'dv' ? 'ސްޓޭޓަސް' : 'Status'}:{' '}
                <span className="font-bold text-gray-900">{String(summary.status || '').toUpperCase()}</span>
              </div>

              {state?.trip?.delay_reason ? (
                <div className="mt-2 text-xs text-amber-800 bg-amber-50 border border-amber-200 rounded-xl p-2">
                  {language === 'dv' ? 'ޑްރައިވަރު ލަސް ވާ ސަބަބު:' : 'Driver delay reason:'}{' '}
                  <span className="font-semibold">{String(state.trip.delay_reason)}</span>
                </div>
              ) : null}

              {String(summary.status) === 'accepted' && summary.enRouteAt ? (
                <div className="mt-2 text-xs text-emerald-800 bg-emerald-50 border border-emerald-200 rounded-xl p-2">
                  {language === 'dv' ? 'ޑްރައިވަރު ނަގާ ތަނަށް ދަންނަވަނީ' : 'Driver is on the way to pickup'}
                </div>
              ) : null}

              {String(summary.status) === 'accepted' && !(typeof summary.driverLat === 'number' && typeof summary.driverLng === 'number') ? (
                <div className="mt-2 text-xs text-gray-600 bg-gray-50 border border-gray-200 rounded-xl p-2">
                  {language === 'dv'
                    ? 'ޑްރައިވަރު ލޮކޭޝަން ލޯޑް ވަނީ...'
                    : 'Waiting for driver location...'}
                </div>
              ) : null}

              <div className="mt-3 grid grid-cols-2 gap-3">
                <div className="text-sm text-gray-600">
                  {language === 'dv' ? 'ނަގާ' : 'Pickup'}
                  <div className="font-bold text-gray-900 truncate">{summary.origin}</div>
                </div>
                <div className="text-sm text-gray-600">
                  {language === 'dv' ? 'ދާން' : 'Destination'}
                  <div className="font-bold text-gray-900 truncate">{summary.destination}</div>
                </div>
                <div className="text-sm text-gray-600">
                  {language === 'dv' ? 'ވެހިކަލް' : 'Vehicle'}
                  <div className="font-bold text-gray-900">{String(summary.vehicleType || '').toUpperCase()}</div>
                </div>
                <div className="text-sm text-gray-600">
                  {language === 'dv' ? 'ފީ' : 'Fare'}
                  <div className="font-bold text-gray-900">{summary.fare}</div>
                </div>
              </div>

              {summary.driverName ? (
                <div className="mt-4 pt-3 border-t">
                  <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                    {language === 'dv' ? 'ޑްރައިވަރު' : 'Driver'}
                  </div>
                  <div className="mt-1 font-extrabold text-gray-900">{summary.driverName}</div>
                  <div className="mt-1 text-sm text-gray-600">
                    {summary.vehicleNumber ? `${language === 'dv' ? 'ނަންބަރ:' : 'Number:'} ${summary.vehicleNumber}` : null}
                  </div>
                  {summary.driverPhone ? (
                    <a className="mt-3 btn-secondary inline-flex" href={`tel:${summary.driverPhone}`}>
                      {language === 'dv' ? 'ކޯލް' : 'Call'}
                    </a>
                  ) : null}
                </div>
              ) : null}

              {String(summary.status) === 'open' ? (
                <button
                  onClick={onCancel}
                  disabled={cancelling}
                  className="mt-4 inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-gray-800 text-sm font-semibold border border-gray-200"
                >
                  <X size={16} className="text-gray-700" />
                  {cancelling ? (language === 'dv' ? 'ކެންސަލް...' : 'Cancelling...') : (language === 'dv' ? 'ކެންސަލް' : 'Cancel Request')}
                </button>
              ) : null}
            </div>

            {resolvedOrigin ? (
              <div className="card p-3">
                <div className="w-full h-64 rounded-xl overflow-hidden relative">
                  <MapContainer
                    center={[resolvedOrigin.lat, resolvedOrigin.lng]}
                    zoom={13}
                    style={{ height: '100%', width: '100%' }}
                    scrollWheelZoom={false}
                  >
                    <MapRefCapture />
                    <TileLayer
                      attribution="&copy; OpenStreetMap contributors"
                      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    <Marker position={[resolvedOrigin.lat, resolvedOrigin.lng]} icon={pickupIcon} />
                    {resolvedDestination ? (
                      <>
                        <Marker position={[resolvedDestination.lat, resolvedDestination.lng]} />
                        {routePoints.length >= 2 ? <Polyline positions={routePoints} /> : null}
                      </>
                    ) : null}
                    {typeof summary.driverLat === 'number' && typeof summary.driverLng === 'number' ? (
                      <Marker position={[summary.driverLat, summary.driverLng]} icon={driverIcon} />
                    ) : null}
                  </MapContainer>

                  <div className="absolute right-3 bottom-3 z-[1000]">
                    <button
                      type="button"
                      onClick={() => {
                        setFollowDriver(true)
                        const lat = summary.driverLat
                        const lng = summary.driverLng
                        if (typeof lat === 'number' && typeof lng === 'number') {
                          mapRef.current?.setView([lat, lng], 16, { animate: true } as any)
                          return
                        }
                        if (routePoints.length >= 2) {
                          mapRef.current?.fitBounds(routePoints as any, { padding: [30, 30] } as any)
                        }
                      }}
                      className="w-11 h-11 rounded-2xl bg-white shadow-lg border border-gray-200 flex items-center justify-center"
                      aria-label="Recenter"
                    >
                      <LocateFixed size={18} className="text-gray-800" />
                    </button>
                  </div>
                </div>
              </div>
            ) : null}
          </div>
        )}
      </div>
    </div>
  )
}
