import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

type UserRole = 'need_service' | 'provide_service' | 'both' | ''

export default function ProfilePage() {
  const navigate = useNavigate()
  const [checking, setChecking] = useState(true)
  const [signedIn, setSignedIn] = useState(false)
  const [email, setEmail] = useState('')
  const [role, setRole] = useState<UserRole>('')

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      const session = data.session
      setSignedIn(Boolean(session))
      setEmail(session?.user?.email || '')
      setRole((session?.user?.user_metadata as any)?.user_role || '')
      setChecking(false)
    }

    const { data: sub } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!mounted) return
      setSignedIn(Boolean(session))
      setEmail(session?.user?.email || '')
      setRole((session?.user?.user_metadata as any)?.user_role || '')
      setChecking(false)
    })

    check()

    return () => {
      mounted = false
      sub.subscription.unsubscribe()
    }
  }, [])

  async function onLogout() {
    await supabase.auth.signOut()
  }

  function goMedicineHelp() {
    if (!signedIn) {
      navigate('/login', { state: { from: { pathname: '/medicine-help' } } })
      return
    }
    navigate('/medicine-help')
  }

  if (checking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Loading...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <h1 className="text-xl font-bold text-gray-800">Dashboard</h1>
      </div>

      <div className="p-4 space-y-4">
        <button
          type="button"
          onClick={goMedicineHelp}
          className="w-full bg-gradient-to-r from-medical-500 to-medical-600 rounded-xl p-4 text-white text-left shadow-lg shadow-medical-500/20"
        >
          <div className="font-bold text-lg">Need Urgent Medicine from Abroad?</div>
          <div className="text-white/80 text-sm mt-1">Upload prescription and request help from the community</div>
        </button>

        <div className="card p-6">
          <div className="flex items-center gap-4">
            <div className="w-14 h-14 bg-medical-100 rounded-full flex items-center justify-center">
              <span className="text-medical-700 text-xl font-bold">U</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="font-bold text-gray-800 truncate">{signedIn ? email : 'Guest'}</div>
              <div className="text-sm text-gray-500">
                {signedIn
                  ? role === 'need_service'
                    ? 'Role: Request medicine help'
                    : role === 'provide_service'
                      ? 'Role: Provide medicine help'
                      : role === 'both'
                        ? 'Role: Request + Provide medicine help'
                      : 'Role: Not set'
                  : 'Sign in to request or provide medicine help'}
              </div>
            </div>
          </div>

          {!signedIn ? (
            <div className="mt-4 space-y-2">
              <button
                type="button"
                onClick={() => navigate('/login')}
                className="btn-primary w-full"
              >
                Sign In
              </button>
              <button
                type="button"
                onClick={() => navigate('/signup')}
                className="btn-secondary w-full"
              >
                Create Account
              </button>
            </div>
          ) : (
            <button type="button" onClick={onLogout} className="btn-secondary w-full mt-4">
              Log out
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
