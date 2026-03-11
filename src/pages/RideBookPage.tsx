import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ChevronLeft, MapPin, Navigation, Car } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { createRideRequest, getHospitals } from '../lib/dataService'

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
  const [vehicleType, setVehicleType] = useState<VehicleType>('bike')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const [places, setPlaces] = useState<string[]>([])
  const [originOpen, setOriginOpen] = useState(false)
  const [destOpen, setDestOpen] = useState(false)
  const originWrapRef = useRef<HTMLDivElement | null>(null)
  const destWrapRef = useRef<HTMLDivElement | null>(null)

  const fare = useMemo(() => fares[vehicleType] ?? 0, [vehicleType])

  function normalizeText(value: string) {
    return (value || '').toLowerCase().trim()
  }

  function parseCsvLine(line: string): string[] {
    const out: string[] = []
    let cur = ''
    let inQuotes = false

    for (let i = 0; i < line.length; i++) {
      const ch = line[i]

      if (ch === '"') {
        if (inQuotes && line[i + 1] === '"') {
          cur += '"'
          i++
        } else {
          inQuotes = !inQuotes
        }
        continue
      }

      if (ch === ',' && !inQuotes) {
        out.push(cur)
        cur = ''
        continue
      }

      cur += ch
    }

    out.push(cur)
    return out
  }

  useEffect(() => {
    let cancelled = false

    async function loadPlaces() {
      const all: string[] = []

      try {
        const hospitals = await getHospitals()
        for (const h of hospitals) {
          const label = [h.name, h.address].filter(Boolean).join(' - ').trim()
          if (label) all.push(label)
        }
      } catch {
      }

      try {
        const res = await fetch('/maldives_pharmacies.csv', { cache: 'no-store' })
        if (res.ok) {
          const text = await res.text()
          const lines = text.split(/\r?\n/).filter(Boolean)
          if (lines.length > 1) {
            const headers = parseCsvLine(lines[0]).map(h => normalizeText(h))
            const idxName = headers.indexOf('name')
            const idxAddress = headers.indexOf('address')
            for (let i = 1; i < lines.length; i++) {
              const cols = parseCsvLine(lines[i])
              const name = (cols[idxName] ?? '').trim()
              if (!name) continue
              const addr = (cols[idxAddress] ?? '').trim()
              const label = [name, addr].filter(Boolean).join(' - ').trim()
              if (label) all.push(label)
            }
          }
        }
      } catch {
      }

      const seen = new Set<string>()
      const unique: string[] = []
      for (const p of all) {
        const key = normalizeText(p)
        if (!key || seen.has(key)) continue
        seen.add(key)
        unique.push(p)
      }

      if (!cancelled) setPlaces(unique)
    }

    loadPlaces()
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    function onDocMouseDown(e: MouseEvent) {
      const target = e.target as any
      if (originWrapRef.current && !originWrapRef.current.contains(target)) setOriginOpen(false)
      if (destWrapRef.current && !destWrapRef.current.contains(target)) setDestOpen(false)
    }
    document.addEventListener('mousedown', onDocMouseDown)
    return () => document.removeEventListener('mousedown', onDocMouseDown)
  }, [])

  const originSuggestions = useMemo(() => {
    const q = normalizeText(origin)
    if (q.length < 2) return []
    return places
      .filter(p => normalizeText(p).includes(q))
      .slice(0, 6)
  }, [origin, places])

  const destinationSuggestions = useMemo(() => {
    const q = normalizeText(destination)
    if (q.length < 2) return []
    return places
      .filter(p => normalizeText(p).includes(q))
      .slice(0, 6)
  }, [destination, places])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSubmitting(true)
    setError(null)

    try {
      const created = await createRideRequest({
        origin_text: origin,
        destination_text: destination,
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
            {language === 'dv' ? 'މަގު ހޯދާ' : 'Book a Ride'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
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

      <div className="px-4 mt-5">
        <form onSubmit={onSubmit} className="space-y-3">
          <div className="card p-4 space-y-3">
            <div>
              <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ނަގާ ތަން' : 'Pickup location'}
              </label>
              <div className="relative" ref={originWrapRef}>
                <MapPin size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                <input
                  value={origin}
                  onChange={(e) => setOrigin(e.target.value)}
                  onFocus={() => setOriginOpen(true)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'މާލެ...' : 'Male...'}
                  required
                />

                {originOpen && originSuggestions.length > 0 ? (
                  <div className="absolute left-0 right-0 mt-2 bg-white border border-gray-200 rounded-xl shadow-lg overflow-hidden z-50">
                    {originSuggestions.map((s) => (
                      <button
                        key={s}
                        type="button"
                        onClick={() => {
                          setOrigin(s)
                          setOriginOpen(false)
                        }}
                        className="w-full text-left px-3 py-2 text-sm hover:bg-gray-50"
                      >
                        {s}
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
                  onChange={(e) => setDestination(e.target.value)}
                  onFocus={() => setDestOpen(true)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'ހޮސްޕިޓަލް...' : 'Hospital...'}
                  required
                />

                {destOpen && destinationSuggestions.length > 0 ? (
                  <div className="absolute left-0 right-0 mt-2 bg-white border border-gray-200 rounded-xl shadow-lg overflow-hidden z-50">
                    {destinationSuggestions.map((s) => (
                      <button
                        key={s}
                        type="button"
                        onClick={() => {
                          setDestination(s)
                          setDestOpen(false)
                        }}
                        className="w-full text-left px-3 py-2 text-sm hover:bg-gray-50"
                      >
                        {s}
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
