import { useEffect } from 'react'
import { Link, Routes, Route, useLocation, useNavigate } from 'react-router-dom'
import { Home, Search, User, MessageCircle } from 'lucide-react'
import HomePage from './pages/HomePage'
import SearchPage from './pages/SearchPage'
import DoctorsPage from './pages/DoctorsPage'
import HospitalsPage from './pages/HospitalsPage'
import ProfilePage from './pages/ProfilePage'
import LoginPage from './pages/LoginPage'
import SignupPage from './pages/SignupPage'
import ResetPasswordPage from './pages/ResetPasswordPage'
import DoctorDetailPage from './pages/DoctorDetailPage'
import HospitalDetailPage from './pages/HospitalDetailPage'
import SmartMatcherPage from './pages/SmartMatcherPage'
import CommunityPage from './pages/CommunityPage'
import AskQuestionPage from './pages/AskQuestionPage'
import QuestionDetailPage from './pages/QuestionDetailPage'
import MedicineHelpPage from './pages/MedicineHelpPage'
import MedicineHelpNewPage from './pages/MedicineHelpNewPage'
import MedicineHelpDetailPage from './pages/MedicineHelpDetailPage'
import AdminDashboard from './pages/admin/AdminDashboard'
import AdminHospitals from './pages/admin/AdminHospitals'
import AdminDoctors from './pages/admin/AdminDoctors'
import AdminReviews from './pages/admin/AdminReviews'
import AdminLogin from './pages/admin/AdminLogin'
import AdminCommunity from './pages/admin/AdminCommunity'
import AdminMedicineHelp from './pages/admin/AdminMedicineHelp'
import RequireAdmin from './components/RequireAdmin'
import RequireAuth from './components/RequireAuth'
import { Footer } from './components/Footer'

function App() {
  const location = useLocation()
  const navigate = useNavigate()

  useEffect(() => {
    const hash = (location.hash || '').trim()
    if (!hash.startsWith('#')) return

    const params = new URLSearchParams(hash.slice(1))
    const errorCode = params.get('error_code')
    const errorDescription = params.get('error_description')

    if (!errorCode) return

    let notice = 'Authentication link is invalid or expired. Please try again.'
    if (errorCode === 'otp_expired') {
      notice = 'This email link has expired. Please request a new one and try again.'
    }
    if (errorDescription && /invalid|expired/i.test(errorDescription)) {
      notice = decodeURIComponent(errorDescription.replace(/\+/g, ' '))
    }

    window.history.replaceState(null, '', window.location.pathname + window.location.search)
    navigate('/login', { replace: true, state: { notice } })
  }, [location.hash, navigate])

  const hideNavPaths = ['/doctor/', '/hospital/', '/smart-match', '/admin', '/community', '/ask']
  const showNav = !hideNavPaths.some(path => location.pathname.startsWith(path))
  const isAdmin = location.pathname.startsWith('/admin')

  return (
    <div className="min-h-screen bg-gray-50 max-w-md mx-auto relative shadow-2xl">
      {/* Main Content */}
      <main className={`${showNav && !isAdmin ? 'pb-20' : ''} safe-top`}>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/search" element={<SearchPage />} />
          <Route path="/doctors" element={<DoctorsPage />} />
          <Route path="/hospitals" element={<HospitalsPage />} />
          <Route path="/profile" element={<ProfilePage />} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/signup" element={<SignupPage />} />
          <Route path="/reset-password" element={<ResetPasswordPage />} />
          <Route path="/doctor/:id" element={<DoctorDetailPage />} />
          <Route path="/hospital/:id" element={<HospitalDetailPage />} />
          <Route path="/smart-match" element={<SmartMatcherPage />} />
          
          {/* Community Routes */}
          <Route path="/community" element={<CommunityPage />} />
          <Route path="/ask" element={<AskQuestionPage />} />
          <Route path="/question/:id" element={<QuestionDetailPage />} />

          {/* Medicine Help (requires user login) */}
          <Route element={<RequireAuth />}>
            <Route path="/medicine-help" element={<MedicineHelpPage />} />
            <Route path="/medicine-help/new" element={<MedicineHelpNewPage />} />
            <Route path="/medicine-help/:id" element={<MedicineHelpDetailPage />} />
          </Route>
          
          {/* Admin Routes */}
          <Route path="/admin/login" element={<AdminLogin />} />
          <Route element={<RequireAdmin />}>
            <Route path="/admin" element={<AdminDashboard />} />
            <Route path="/admin/hospitals" element={<AdminHospitals />} />
            <Route path="/admin/doctors" element={<AdminDoctors />} />
            <Route path="/admin/reviews" element={<AdminReviews />} />
            <Route path="/admin/community" element={<AdminCommunity />} />
            <Route path="/admin/medicine-help" element={<AdminMedicineHelp />} />
          </Route>
        </Routes>
      </main>

      {/* Footer - shown on all pages except admin */}
      {!isAdmin && (
        <div className="pb-20">
          <Footer />
        </div>
      )}

      {/* Bottom Navigation */}
      {showNav && (
        <nav className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 safe-bottom z-50 max-w-md mx-auto">
          <div className="flex justify-around items-center h-16">
            <NavLink to="/" icon={<Home size={24} />} label="Home" />
            <NavLink to="/search" icon={<Search size={24} />} label="Search" />
            <button
              onClick={() => navigate('/smart-match')}
              className="bg-medical-500 text-white rounded-full p-3 shadow-lg shadow-medical-500/40 hover:bg-medical-600 transition-all active:scale-95"
            >
              <img src="/images/logo.png" alt="Smart Match" className="w-6 h-6" />
            </button>
            <NavLink to="/community" icon={<MessageCircle size={24} />} label="Community" />
            <NavLink to="/profile" icon={<User size={24} />} label="Profile" />
          </div>
        </nav>
      )}
    </div>
  )
}

function NavLink({ to, icon, label }: { to: string; icon: React.ReactNode; label: string }) {
  const location = useLocation()
  const isActive = location.pathname === to

  return (
    <Link
      to={to}
      className={`flex flex-col items-center justify-center w-16 h-full transition-colors ${
        isActive ? 'text-medical-600' : 'text-gray-400 hover:text-gray-600'
      }`}
    >
      {icon}
      <span className="text-xs mt-1 font-medium">{label}</span>
    </Link>
  )
}

export default App
