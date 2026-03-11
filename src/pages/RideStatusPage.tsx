import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronLeft, Car, MapPin, X } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { cancelMyOpenRideRequest, getMyLatestRideState } from '../lib/dataService'
import { MapContainer, Marker, Polyline, TileLayer } from 'react-leaflet'
import { supabase } from '../lib/supabase'

export default function RideStatusPage() {
  const { language } = useLanguage()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [state, setState] = useState<any>(null)
  const [cancelling, setCancelling] = useState(false)
  const [routePoints, setRoutePoints] = useState<Array<[number, number]>>([])

  useEffect(() => {
    load()
    const t = window.setInterval(load, 5000)
    return () => window.clearInterval(t)
  }, [])

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
      driverLat: trip?.driver_lat,
      driverLng: trip?.driver_lng
    }
  }, [state])

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
    async function fetchRoute() {
      const fromLat = summary?.originLat
      const fromLng = summary?.originLng
      const toLat = summary?.destinationLat
      const toLng = summary?.destinationLng
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
  }, [summary?.originLat, summary?.originLng, summary?.destinationLat, summary?.destinationLng])

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
              <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ސްޓޭޓަސް' : 'Status'}
              </div>
              <div className="mt-1 text-xl font-extrabold text-gray-900">{String(summary.status).toUpperCase()}</div>

              <div className="mt-3 space-y-2 text-sm text-gray-700">
                <div className="flex items-center gap-2">
                  <MapPin size={16} className="text-medical-700" />
                  <span className="font-semibold">{language === 'dv' ? 'ނަގާ' : 'Pickup'}:</span>
                  <span className="truncate">{summary.origin}</span>
                </div>
                <div className="flex items-center gap-2">
                  <MapPin size={16} className="text-medical-700" />
                  <span className="font-semibold">{language === 'dv' ? 'ދާން' : 'Destination'}:</span>
                  <span className="truncate">{summary.destination}</span>
                </div>
                <div className="flex items-center justify-between pt-2 border-t">
                  <span className={`text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{language === 'dv' ? 'ވާހަން' : 'Vehicle'}</span>
                  <span className="font-bold">{String(summary.vehicleType).toUpperCase()}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className={`text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{language === 'dv' ? 'އަގު' : 'Fare'}</span>
                  <span className="font-bold tabular-nums">{summary.fare}</span>
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

            {typeof summary.originLat === 'number' && typeof summary.originLng === 'number' ? (
              <div className="card p-3">
                <div className="w-full h-64 rounded-xl overflow-hidden">
                  <MapContainer
                    center={[summary.originLat, summary.originLng]}
                    zoom={13}
                    style={{ height: '100%', width: '100%' }}
                    scrollWheelZoom={false}
                  >
                    <TileLayer
                      attribution="&copy; OpenStreetMap contributors"
                      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    <Marker position={[summary.originLat, summary.originLng]} />
                    {typeof summary.destinationLat === 'number' && typeof summary.destinationLng === 'number' ? (
                      <>
                        <Marker position={[summary.destinationLat, summary.destinationLng]} />
                        {routePoints.length >= 2 ? <Polyline positions={routePoints} /> : null}
                      </>
                    ) : null}
                    {typeof summary.driverLat === 'number' && typeof summary.driverLng === 'number' ? (
                      <Marker position={[summary.driverLat, summary.driverLng]} />
                    ) : null}
                  </MapContainer>
                </div>
              </div>
            ) : null}
          </div>
        )}
      </div>
    </div>
  )
}
