import { useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ChevronLeft, MapPin, Navigation, Car } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import { createRideRequest } from '../lib/dataService'

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

  const fare = useMemo(() => fares[vehicleType] ?? 0, [vehicleType])

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
              <div className="relative">
                <MapPin size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                <input
                  value={origin}
                  onChange={(e) => setOrigin(e.target.value)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'މާލެ...' : 'Male...'}
                  required
                />
              </div>
            </div>

            <div>
              <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ދާން ތަން' : 'Destination'}
              </label>
              <div className="relative">
                <Navigation size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                <input
                  value={destination}
                  onChange={(e) => setDestination(e.target.value)}
                  className="w-full pl-9 pr-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none"
                  placeholder={language === 'dv' ? 'ހޮސްޕިޓަލް...' : 'Hospital...'}
                  required
                />
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
