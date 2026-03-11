import { Link } from 'react-router-dom'
import { ChevronLeft, Car, ShieldCheck, User } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'

export default function RidePage() {
  const { language } = useLanguage()

  return (
    <div className={`min-h-screen pb-24 ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <Link
            to="/"
            className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center"
            aria-label="Back"
          >
            <ChevronLeft size={20} className="text-white" />
          </Link>
          <h1 className={`text-white text-xl font-bold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
            {language === 'dv' ? 'މެޑްލިންކް ރައިޑް' : 'Medlink Ride'}
          </h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 flex items-center gap-3">
          <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
            <Car size={22} className="text-white" />
          </div>
          <div className="min-w-0">
            <div className={`text-white text-lg font-extrabold ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'މަގު ހޯދާ ސާރވިސް' : 'Find a ride fast'}
            </div>
            <div className={`text-white/80 text-sm ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv'
                ? 'ތިބާގެ ތަނާއި ދާން ތަން ނެގޭ'
                : 'Choose your pickup and destination'}
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 mt-5 space-y-3">
        <Link
          to="/ride/book"
          className="card p-4 flex items-center gap-3"
        >
          <div className="w-12 h-12 rounded-2xl bg-medical-100 flex items-center justify-center">
            <User size={22} className="text-medical-700" />
          </div>
          <div className="flex-1 min-w-0">
            <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'މަގު ހޯދާ' : 'Book a Ride'}
            </div>
            <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ބައިކް / ކާރ / ވޭން / ޕިކަޕް' : 'Bike / Car / Van / Pickup'}
            </div>
          </div>
        </Link>

        <Link
          to="/ride/driver/signup"
          className="card p-4 flex items-center gap-3"
        >
          <div className="w-12 h-12 rounded-2xl bg-purple-100 flex items-center justify-center">
            <Car size={22} className="text-purple-700" />
          </div>
          <div className="flex-1 min-w-0">
            <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ޑްރައިވަރު ވުމަށް' : 'Become a Driver'}
            </div>
            <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރަޖިސްޓްރޭޝަން ކުރޭ' : 'Register and get approved'}
            </div>
          </div>
          <div className="shrink-0">
            <ShieldCheck size={20} className="text-gray-400" />
          </div>
        </Link>

        <Link
          to="/ride/driver/dashboard"
          className="card p-4 flex items-center gap-3"
        >
          <div className="w-12 h-12 rounded-2xl bg-teal-100 flex items-center justify-center">
            <ShieldCheck size={22} className="text-teal-700" />
          </div>
          <div className="flex-1 min-w-0">
            <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ޑްރައިވަރ ޑޭޝްބޯރޑް' : 'Driver Dashboard'}
            </div>
            <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރައިޑް ރިކުއެސްޓް ބަލާ' : 'View and accept requests'}
            </div>
          </div>
        </Link>

        <Link
          to="/ride/status"
          className="card p-4 flex items-center gap-3"
        >
          <div className="w-12 h-12 rounded-2xl bg-yellow-100 flex items-center justify-center">
            <Car size={22} className="text-yellow-700" />
          </div>
          <div className="flex-1 min-w-0">
            <div className={`font-extrabold text-gray-900 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރައިޑް ސްޓޭޓަސް' : 'My Ride Status'}
            </div>
            <div className={`text-sm text-gray-500 mt-1 ${language === 'dv' ? 'dhivehi-font' : ''}`}>
              {language === 'dv' ? 'ރައިޑް އަދި ޑްރައިވަރު' : 'Track your request and trip'}
            </div>
          </div>
        </Link>
      </div>
    </div>
  )
}
