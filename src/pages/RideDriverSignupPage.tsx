import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ChevronLeft, Car, Upload, ShieldCheck } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'
import {
  createRideDriverProfile,
  getMyRideDriverProfile,
  updateMyRideDriverProfile,
  uploadRideDriverImage
} from '../lib/dataService'

type VehicleType = 'bike' | 'car' | 'van' | 'pickup'

export default function RideDriverSignupPage() {
  const { language } = useLanguage()
  const navigate = useNavigate()

  const [loading, setLoading] = useState(true)
  const [existing, setExisting] = useState<any>(null)
  const [reapplyMode, setReapplyMode] = useState(false)

  const [fullName, setFullName] = useState('')
  const [phone, setPhone] = useState('')
  const [vehicleType, setVehicleType] = useState<VehicleType>('bike')
  const [vehicleBrand, setVehicleBrand] = useState('')
  const [vehicleColor, setVehicleColor] = useState('')
  const [vehicleNumber, setVehicleNumber] = useState('')
  const [licenseNumber, setLicenseNumber] = useState('')
  const [annualFee, setAnnualFee] = useState('')

  const [driverImage, setDriverImage] = useState<File | null>(null)
  const [licenseImage, setLicenseImage] = useState<File | null>(null)
  const [vehicleImage, setVehicleImage] = useState<File | null>(null)

  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    try {
      const me = await getMyRideDriverProfile()
      setExisting(me)
      setReapplyMode(false)
      if (me) {
        setFullName(me.full_name || '')
        setPhone(me.phone || '')
        setVehicleType(me.vehicle_type || 'bike')
        setVehicleBrand(me.vehicle_brand || '')
        setVehicleColor(me.vehicle_color || '')
        setVehicleNumber(me.vehicle_number || '')
        setLicenseNumber(me.license_number || '')
        setAnnualFee(String(me.annual_fee ?? ''))
      }
    } catch {
      setExisting(null)
    } finally {
      setLoading(false)
    }
  }

  const statusLabel = useMemo(() => {
    const s = String(existing?.status || 'pending')
    if (s === 'approved') return language === 'dv' ? 'އެޕްރޫވް' : 'Approved'
    if (s === 'rejected') return language === 'dv' ? 'ރިޖެކްޓް' : 'Rejected'
    if (s === 'suspended') return language === 'dv' ? 'ސަސްޕެންޑް' : 'Suspended'
    return language === 'dv' ? 'ޕެންޑިންގ' : 'Pending approval'
  }, [existing?.status, language])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSubmitting(true)
    setError(null)

    try {
      if (existing?.id && String(existing.status) !== 'rejected') {
        navigate('/ride/driver/dashboard')
        return
      }

      const driverImagePath = driverImage ? await uploadRideDriverImage(driverImage, 'driver') : null
      const licenseImagePath = licenseImage ? await uploadRideDriverImage(licenseImage, 'license') : null
      const vehicleImagePath = vehicleImage ? await uploadRideDriverImage(vehicleImage, 'vehicle') : null

      const annual = annualFee ? Number(annualFee) : 0

      const saved = existing?.id
        ? await updateMyRideDriverProfile({
            full_name: fullName,
            phone,
            vehicle_type: vehicleType,
            vehicle_brand: vehicleBrand,
            vehicle_color: vehicleColor,
            vehicle_number: vehicleNumber,
            license_number: licenseNumber,
            annual_fee: annual,
            driver_image_path: driverImagePath,
            license_image_path: licenseImagePath,
            vehicle_image_path: vehicleImagePath
          })
        : await createRideDriverProfile({
            full_name: fullName,
            phone,
            vehicle_type: vehicleType,
            vehicle_brand: vehicleBrand,
            vehicle_color: vehicleColor,
            vehicle_number: vehicleNumber,
            license_number: licenseNumber,
            annual_fee: annual,
            driver_image_path: driverImagePath,
            license_image_path: licenseImagePath,
            vehicle_image_path: vehicleImagePath
          })

      if (!saved?.id) throw new Error(existing?.id ? 'Failed to re-apply' : 'Failed to register driver')
      navigate('/ride/driver/dashboard', { replace: true })
    } catch (err: any) {
      setError(err?.message || 'Failed to register')
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
            {language === 'dv' ? 'ޑްރައިވަރު ރަޖިސްޓްރޭޝަން' : 'Driver Registration'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
            <Car size={22} className="text-white" />
          </div>
          <div className="min-w-0">
            <div className={`text-white text-lg font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'އެޑްމިން އެޕްރޫވަލް ހުރި' : 'Admin approval required'}
            </div>
            <div className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރަޖިސްޓަރ ކުރާށެވެ' : 'Register and wait for approval'}
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 mt-5">
        {loading ? (
          <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'ލޯޑް ވަނީ...' : 'Loading...'}
          </div>
        ) : existing?.id && !(String(existing?.status) === 'rejected' && reapplyMode) ? (
          <div className="card p-4">
            <div className="flex items-center gap-2">
              <ShieldCheck size={18} className="text-medical-700" />
              <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                {language === 'dv' ? 'ތިބާގެ ޕްރޮފައިލް' : 'Your driver profile'}
              </div>
            </div>
            <div className="mt-2 text-sm text-gray-600">
              {language === 'dv' ? 'ސްޓޭޓަސް:' : 'Status:'} <span className="font-bold">{statusLabel}</span>
            </div>
            {String(existing?.status) === 'rejected' && existing?.rejection_reason ? (
              <div className="mt-3 text-sm text-red-700 bg-red-50 border border-red-200 rounded-xl p-3">
                {language === 'dv' ? 'ރިޖެކްޓް ސަބަބު:' : 'Rejection reason:'}{' '}
                <span className="font-semibold">{existing.rejection_reason}</span>
              </div>
            ) : null}
            {String(existing?.status) === 'suspended' ? (
              <div className="mt-3 text-sm text-amber-900 bg-amber-50 border border-amber-200 rounded-xl p-3">
                {language === 'dv' ? 'ސަސްޕެންޑް' : 'Suspended'}
                {existing?.suspended_reason ? (
                  <>
                    {': '}<span className="font-semibold">{String(existing.suspended_reason)}</span>
                  </>
                ) : null}
              </div>
            ) : null}
            <Link to="/ride/driver/dashboard" className="btn-primary inline-flex mt-4">
              {language === 'dv' ? 'ޑޭޝްބޯރޑް' : 'Go to dashboard'}
            </Link>
            {String(existing?.status) === 'rejected' ? (
              <button
                type="button"
                onClick={() => setReapplyMode(true)}
                className="btn-secondary inline-flex mt-3"
              >
                {language === 'dv' ? 'ރީ-އެޕްލައި' : 'Re-apply'}
              </button>
            ) : null}
          </div>
        ) : (
          <form onSubmit={onSubmit} className="space-y-3">
            <div className="card p-4 space-y-3">
              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ނަން' : 'Full name'}
                </label>
                <input value={fullName} onChange={(e) => setFullName(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ފޯން' : 'Phone'}
                </label>
                <input value={phone} onChange={(e) => setPhone(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ވާހަން' : 'Vehicle type'}
                </label>
                <select value={vehicleType} onChange={(e) => setVehicleType(e.target.value as VehicleType)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none">
                  <option value="bike">{language === 'dv' ? 'ބައިކް' : 'Bike'}</option>
                  <option value="car">{language === 'dv' ? 'ކާރ' : 'Car'}</option>
                  <option value="van">{language === 'dv' ? 'ވޭން' : 'Van'}</option>
                  <option value="pickup">{language === 'dv' ? 'ޕިކަޕް' : 'Pickup'}</option>
                </select>
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ބްރޭންޑް' : 'Vehicle brand'}
                </label>
                <input value={vehicleBrand} onChange={(e) => setVehicleBrand(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ކުލަ' : 'Vehicle color'}
                </label>
                <input value={vehicleColor} onChange={(e) => setVehicleColor(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ނަންބަރ' : 'Vehicle number'}
                </label>
                <input value={vehicleNumber} onChange={(e) => setVehicleNumber(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ލައިސެންސް' : 'License number'}
                </label>
                <input value={licenseNumber} onChange={(e) => setLicenseNumber(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" required />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'އެނުއަލް ފީ' : 'Annual fee'}
                </label>
                <input type="number" value={annualFee} onChange={(e) => setAnnualFee(e.target.value)} className="w-full px-3 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none" />
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ޑްރައިވަރ ފޮޓޯ' : 'Driver photo'}
                </label>
                <label className="flex items-center gap-2 px-3 py-3 rounded-xl bg-white border border-gray-200 cursor-pointer">
                  <Upload size={16} className="text-gray-500" />
                  <span className="text-sm text-gray-700">{driverImage?.name || (language === 'dv' ? 'ފައިލް ނަގާ' : 'Choose file')}</span>
                  <input type="file" accept="image/*" className="hidden" onChange={(e) => setDriverImage(e.target.files?.[0] || null)} />
                </label>
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ލައިސެންސް ފޮޓޯ' : 'License photo'}
                </label>
                <label className="flex items-center gap-2 px-3 py-3 rounded-xl bg-white border border-gray-200 cursor-pointer">
                  <Upload size={16} className="text-gray-500" />
                  <span className="text-sm text-gray-700">{licenseImage?.name || (language === 'dv' ? 'ފައިލް ނަގާ' : 'Choose file')}</span>
                  <input type="file" accept="image/*" className="hidden" onChange={(e) => setLicenseImage(e.target.files?.[0] || null)} />
                </label>
              </div>

              <div>
                <label className={`block text-sm font-semibold text-gray-800 mb-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
                  {language === 'dv' ? 'ވާހަނު ފޮޓޯ' : 'Vehicle photo'}
                </label>
                <label className="flex items-center gap-2 px-3 py-3 rounded-xl bg-white border border-gray-200 cursor-pointer">
                  <Upload size={16} className="text-gray-500" />
                  <span className="text-sm text-gray-700">{vehicleImage?.name || (language === 'dv' ? 'ފައިލް ނަގާ' : 'Choose file')}</span>
                  <input type="file" accept="image/*" className="hidden" onChange={(e) => setVehicleImage(e.target.files?.[0] || null)} />
                </label>
              </div>

              {error ? <div className="text-sm text-red-600">{error}</div> : null}

              <button type="submit" disabled={submitting} className="btn-primary w-full justify-center">
                {submitting ? (language === 'dv' ? 'ފޮނުވަނީ...' : 'Submitting...') : (language === 'dv' ? 'ރަޖިސްޓަރ' : 'Register')}
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  )
}
