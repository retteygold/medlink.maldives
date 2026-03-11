import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ChevronLeft, MapPin, Navigation, Car, LocateFixed } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { createRideRequest } from '../lib/dataService'
import { MapContainer, Marker, Polyline, TileLayer, useMap } from 'react-leaflet'
import type { Map as LeafletMap } from 'leaflet'

type VehicleType = 'bike' | 'car' | 'van' | 'pickup'

const fares: Record<VehicleType, number> = {
  bike: 15,
  car: 70,
  van: 100,
  pickup: 50
}

export default function RideBookPage() {
  const { language } = useLanguage()
  const navigate = useNavigate()

  const [origin, setOrigin] = useState('')
  const [destination, setDestination] = useState('')
  const [originCoords, setOriginCoords] = useState<{ lat: number; lng: number } | null>(null)
  const [destinationCoords, setDestinationCoords] = useState<{ lat: number; lng: number } | null>(null)
  const [myCoords, setMyCoords] = useState<{ lat: number; lng: number } | null>(null)
  const [vehicleType, setVehicleType] = useState<VehicleType>('bike')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  type PlaceOption = { label: string; lat: number; lng: number }

  const [originOptions, setOriginOptions] = useState<PlaceOption[]>([])
  const [destOptions, setDestOptions] = useState<PlaceOption[]>([])
  const [originLoading, setOriginLoading] = useState(false)
  const [destLoading, setDestLoading] = useState(false)
  const [originOpen, setOriginOpen] = useState(false)
  const [destOpen, setDestOpen] = useState(false)
  const originWrapRef = useRef<HTMLDivElement | null>(null)
  const destWrapRef = useRef<HTMLDivElement | null>(null)

  const fare = useMemo(() => fares[vehicleType] ?? 0, [vehicleType])

  const mapCenter = useMemo<[number, number]>(() => {
    if (originCoords) return [originCoords.lat, originCoords.lng]
    if (destinationCoords) return [destinationCoords.lat, destinationCoords.lng]
    return [4.1755, 73.5093]
  }, [destinationCoords, originCoords])

  const mapRef = useRef<LeafletMap | null>(null)
  const [routePoints, setRoutePoints] = useState<Array<[number, number]>>([])

  function MapRefCapture() {
    const map = useMap()
    useEffect(() => {
      mapRef.current = map
    }, [map])
    return null
  }

  async function fetchRoute(from: { lat: number; lng: number }, to: { lat: number; lng: number }) {
    try {
      const url = `https://router.project-osrm.org/route/v1/driving/${from.lng},${from.lat};${to.lng},${to.lat}?overview=full&geometries=geojson`
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
      mapRef.current?.fitBounds(pts as any, { padding: [30, 30] } as any)
    } catch {
      setRoutePoints([
        [from.lat, from.lng],
        [to.lat, to.lng]
      ])
    }
  }

  useEffect(() => {
    if (originCoords && destinationCoords) {
      fetchRoute(originCoords, destinationCoords)
    } else {
      setRoutePoints([])
    }
  }, [originCoords, destinationCoords])

  async function searchPhoton(query: string): Promise<PlaceOption[]> {
    const q = (query || '').trim()
    if (q.length < 2) return []

    const bbox = {
      minLat: 4.10,
      maxLat: 4.27,
      minLng: 73.42,
      maxLng: 73.60
    }
    const url = `https://photon.komoot.io/api/?q=${encodeURIComponent(q)}&limit=10&lat=4.1755&lon=73.5093&bbox=${bbox.minLng},${bbox.minLat},${bbox.maxLng},${bbox.maxLat}`
    const res = await fetch(url)
    if (!res.ok) return []
    const json: any = await res.json()
    const features = Array.isArray(json?.features) ? json.features : []
    const out: PlaceOption[] = []
    const seen = new Set<string>()
    for (const f of features) {
      const coords = f?.geometry?.coordinates
      const props = f?.properties
      const lng = Array.isArray(coords) ? Number(coords[0]) : NaN
      const lat = Array.isArray(coords) ? Number(coords[1]) : NaN
      if (!Number.isFinite(lat) || !Number.isFinite(lng)) continue
      if (lat < bbox.minLat || lat > bbox.maxLat || lng < bbox.minLng || lng > bbox.maxLng) continue
      const name = String(props?.name || '').trim()
      const city = String(props?.city || props?.district || props?.county || '').trim()
      const state = String(props?.state || '').trim()
      const country = String(props?.country || '').trim()
      const parts = [name, city, state, country].filter(Boolean)
      const label = parts.join(', ')
      const key = label.toLowerCase()
      if (!label || seen.has(key)) continue
      seen.add(key)
      out.push({ label, lat, lng })
    }
    return out
  }

  useEffect(() => {
    function onDocMouseDown(e: MouseEvent) {
      const target = e.target as any
      if (originWrapRef.current && !originWrapRef.current.contains(target)) setOriginOpen(false)
      if (destWrapRef.current && !destWrapRef.current.contains(target)) setDestOpen(false)
    }
    document.addEventListener('mousedown', onDocMouseDown)
    return () => document.removeEventListener('mousedown', onDocMouseDown)
  }, [])

  useEffect(() => {
    const q = origin.trim()
    setOriginCoords(null)
    if (q.length < 2) {
      setOriginOptions([])
      return
    }

    setOriginLoading(true)
    const t = window.setTimeout(() => {
      searchPhoton(q)
        .then(setOriginOptions)
        .finally(() => setOriginLoading(false))
    }, 300)

    return () => window.clearTimeout(t)
  }, [origin])

  useEffect(() => {
    const q = destination.trim()
    setDestinationCoords(null)
    if (q.length < 2) {
      setDestOptions([])
      return
    }

    setDestLoading(true)
    const t = window.setTimeout(() => {
      searchPhoton(q)
        .then(setDestOptions)
        .finally(() => setDestLoading(false))
    }, 300)

    return () => window.clearTimeout(t)
  }, [destination])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSubmitting(true)
    setError(null)

    try {
      const created = await createRideRequest({
        origin_text: origin,
        origin_lat: originCoords?.lat ?? null,
        origin_lng: originCoords?.lng ?? null,
        destination_text: destination,
        destination_lat: destinationCoords?.lat ?? null,
        destination_lng: destinationCoords?.lng ?? null,
        vehicle_type: vehicleType,
        fare
      })
      if (!created?.id) throw new Error('Failed to create ride request')
      navigate('/ride/status', { replace: true })
    } catch (err: any) {
      setError(typeof err?.message === 'string' ? err.message : 'Failed to request ride')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className={`min-h-screen pb-24 relative ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      <div className="absolute inset-0 z-0">
        <MapContainer
          center={mapCenter}
          zoom={13}
          style={{ height: '100%', width: '100%' }}
          scrollWheelZoom={false}
        >
          <MapRefCapture />
          <TileLayer attribution="&copy; OpenStreetMap contributors" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
          {originCoords ? <Marker position={[originCoords.lat, originCoords.lng]} /> : null}
          {destinationCoords ? <Marker position={[destinationCoords.lat, destinationCoords.lng]} /> : null}
          {myCoords ? <Marker position={[myCoords.lat, myCoords.lng]} /> : null}
          {routePoints.length >= 2 ? <Polyline positions={routePoints} /> : null}
        </MapContainer>
        <div className="absolute inset-0 bg-gradient-to-b from-black/35 via-black/10 to-black/40 pointer-events-none" />

        <div className="absolute right-4 bottom-28 z-[1000]">
          <button
            type="button"
            onClick={() => {
              setError(null)
              if (!('geolocation' in navigator)) {
                setError('Geolocation is not supported on this device')
                return
              }
              navigator.geolocation.getCurrentPosition(
                (pos) => {
                  const lat = pos.coords.latitude
                  const lng = pos.coords.longitude
                  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return
                  setMyCoords({ lat, lng })
                  mapRef.current?.setView([lat, lng], 16, { animate: true })
                },
                () => {
                  setError('Location permission denied')
                },
                { enableHighAccuracy: true, timeout: 10000 }
              )
            }}
            className="w-11 h-11 rounded-2xl bg-white shadow-lg border border-gray-200 flex items-center justify-center"
            aria-label="Current location"
          >
            <LocateFixed size={18} className="text-gray-800" />
          </button>
        </div>
      </div>

      <div className="relative z-20 px-4 pt-12">
        <div className="flex items-center justify-between">
          <Link
            to="/ride"
            className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center backdrop-blur"
            aria-label="Back"
          >
            <ChevronLeft size={20} className="text-white" />
          </Link>
          <h1 className={`text-white text-xl font-bold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'މަގު ހޯދާ' : 'Book a Ride'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center backdrop-blur">
            <Car size={22} className="text-white" />
          </div>
          <div className="min-w-0">
            <div className={`text-white text-lg font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ތަނާއި ދާން ތަން ނެގޭ' : 'Pickup and destination'}
            </div>
            <div className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ވާހަކަ ލިޔޭ' : 'Type the locations'}
            </div>
          </div>
        </div>
      </div>

      <div className="relative z-20 px-4 mt-5">
        <form onSubmit={onSubmit} className="space-y-3">
          <div className="card p-4 space-y-3 bg-white/95 backdrop-blur border border-white/40">
            <div>
              <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ނަގާ ތަން' : 'Pickup location'}
              </label>
              <div className="relative" ref={originWrapRef}>
                <MapPin size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                <input
                  value={origin}
                  onChange={(e) => {
                    setOrigin(e.target.value)
                    setOriginOpen(true)
                  }}
                  onFocus={() => setOriginOpen(true)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'މާލެ...' : 'Male...'}
                  required
                />

                {originOpen && (originLoading || originOptions.length > 0) ? (
                  <div className="absolute left-0 right-0 mt-2 bg-white border border-gray-200 rounded-xl shadow-lg overflow-hidden z-50">
                    {originLoading ? (
                      <div className="px-3 py-2 text-sm text-gray-500">Searching...</div>
                    ) : null}
                    {originOptions.map((o) => (
                      <button
                        key={`${o.label}-${o.lat}-${o.lng}`}
                        type="button"
                        onClick={() => {
                          setOrigin(o.label)
                          setOriginCoords({ lat: o.lat, lng: o.lng })
                          setOriginOpen(false)
                        }}
                        className="w-full text-left px-3 py-2 text-sm hover:bg-gray-50"
                      >
                        {o.label}
                      </button>
                    ))}
                  </div>
                ) : null}
              </div>
            </div>

            <div>
              <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ދާން ތަން' : 'Destination'}
              </label>
              <div className="relative" ref={destWrapRef}>
                <Navigation size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                <input
                  value={destination}
                  onChange={(e) => {
                    setDestination(e.target.value)
                    setDestOpen(true)
                  }}
                  onFocus={() => setDestOpen(true)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'ހޮސްޕިޓަލް...' : 'Hospital...'}
                  required
                />

                {destOpen && (destLoading || destOptions.length > 0) ? (
                  <div className="absolute left-0 right-0 mt-2 bg-white border border-gray-200 rounded-xl shadow-lg overflow-hidden z-50">
                    {destLoading ? (
                      <div className="px-3 py-2 text-sm text-gray-500">Searching...</div>
                    ) : null}
                    {destOptions.map((o) => (
                      <button
                        key={`${o.label}-${o.lat}-${o.lng}`}
                        type="button"
                        onClick={() => {
                          setDestination(o.label)
                          setDestinationCoords({ lat: o.lat, lng: o.lng })
                          setDestOpen(false)
                        }}
                        className="w-full text-left px-3 py-2 text-sm hover:bg-gray-50"
                      >
                        {o.label}
                      </button>
                    ))}
                  </div>
                ) : null}
              </div>
            </div>

            <div>
              <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ވާހަން' : 'Vehicle type'}
              </label>
              <select
                value={vehicleType}
                onChange={(e) => setVehicleType(e.target.value as VehicleType)}
                className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
              >
                <option value="bike">{language === 'dv' ? 'ބައިކް' : 'Bike'}</option>
                <option value="car">{language === 'dv' ? 'ކާރ' : 'Car'}</option>
                <option value="van">{language === 'dv' ? 'ވޭން' : 'Van'}</option>
                <option value="pickup">{language === 'dv' ? 'ޕިކަޕް' : 'Pickup'}</option>
              </select>
            </div>

            <div className="flex items-center justify-between pt-2 border-t">
              <div className={`text-sm text-gray-600 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'އަގު' : 'Fare'}
              </div>
              <div className="text-lg font-extrabold text-gray-900 tabular-nums">{fare}</div>
            </div>

            {error ? <div className="text-sm text-red-600">{error}</div> : null}

            <button
              type="submit"
              disabled={submitting}
              className="btn-primary w-full justify-center"
            >
              {submitting
                ? (language === 'dv' ? 'ފޮނުވަނީ...' : 'Requesting...')
                : (language === 'dv' ? 'ރައިޑް ހޯދާ' : 'Request Ride')}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
