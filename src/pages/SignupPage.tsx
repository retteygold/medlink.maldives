import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

type UserRole = 'need_service' | 'provide_service'

type MedicineHelpRole = UserRole | 'both'

export default function SignupPage() {
  const navigate = useNavigate()
  const location = useLocation() as any

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [role, setRole] = useState<MedicineHelpRole>('need_service')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  function friendlyAuthError(err: any): string {
    const status = err?.status
    const message = typeof err?.message === 'string' ? err.message : ''

    if (status === 429 || /too many requests/i.test(message)) {
      return 'Too many attempts. Please wait a few minutes and try again.'
    }

    if (/captcha/i.test(message)) {
      return 'Signup is protected by CAPTCHA and is currently not configured. Please disable CAPTCHA in Supabase Auth settings or configure it.'
    }

    if (/invalid login credentials/i.test(message)) {
      return 'Invalid email or password.'
    }

    if (message) return message
    return 'Signup failed. Please try again.'
  }

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      if (data.session) {
        const from = location.state?.from?.pathname || '/profile'
        navigate(from, { replace: true })
      }
    }

    check()

    return () => {
      mounted = false
    }
  }, [location.state, navigate])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)

    if (password !== confirmPassword) {
      setError('Passwords do not match.')
      setLoading(false)
      return
    }

    const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
      email: email.trim(),
      password,
      options: {
        data: {
          user_role: role
        }
      }
    })

    if (signUpError) {
      setError(friendlyAuthError(signUpError))
      setLoading(false)
      return
    }

    const from = location.state?.from?.pathname || '/profile'

    if (signUpData?.session) {
      navigate(from, { replace: true })
      return
    }

    navigate('/login', {
      replace: true,
      state: {
        from: location.state?.from,
        notice: 'Account created. Please sign in to continue.'
      }
    })
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="gradient-header px-4 pt-12 pb-8 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <button
            type="button"
            onClick={() => (window.history.length > 1 ? navigate(-1) : navigate('/'))}
            className="text-white/80 text-sm font-medium"
          >
            Back
          </button>
          <div className="text-white/80 text-sm">MedLink</div>
        </div>

        <div className="mt-6 flex items-center gap-4">
          <div className="flex-1">
            <h1 className="text-2xl font-bold text-white">Create Account</h1>
            <p className="text-white/80 text-sm mt-1">Choose how you want to use medicine help</p>
          </div>
          <img
            src="/images/storyset/Doctors-cuate.svg"
            alt="Signup"
            className="w-24 h-24 object-contain drop-shadow-lg"
          />
        </div>
      </div>

      <div className="px-4 -mt-6">
        <div className="bg-white rounded-2xl shadow-sm p-6">
          {error && (
            <div className="mb-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
              {error}
            </div>
          )}

          <form onSubmit={onSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">I am here to</label>
              <div className="grid grid-cols-1 gap-2">
                <button
                  type="button"
                  onClick={() => setRole('need_service')}
                  className={`p-4 rounded-2xl border text-left transition-colors ${
                    role === 'need_service' ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white hover:bg-gray-50'
                  }`}
                >
                  <div className="font-bold text-gray-800">Request medicine help</div>
                  <div className="text-xs text-gray-500 mt-1">I need medicine from abroad / not available locally</div>
                </button>
                <button
                  type="button"
                  onClick={() => setRole('provide_service')}
                  className={`p-4 rounded-2xl border text-left transition-colors ${
                    role === 'provide_service' ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white hover:bg-gray-50'
                  }`}
                >
                  <div className="font-bold text-gray-800">Help others bring medicine</div>
                  <div className="text-xs text-gray-500 mt-1">I can purchase abroad and deliver</div>
                </button>

                <button
                  type="button"
                  onClick={() => setRole('both')}
                  className={`p-4 rounded-2xl border text-left transition-colors ${
                    role === 'both' ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white hover:bg-gray-50'
                  }`}
                >
                  <div className="font-bold text-gray-800">Both</div>
                  <div className="text-xs text-gray-500 mt-1">I may request help and also help others</div>
                </button>
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="input-field"
                required
                autoComplete="email"
                placeholder="you@example.com"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Password</label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="input-field"
                required
                autoComplete="new-password"
                placeholder="Create a password"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Confirm password</label>
              <input
                type="password"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                className="input-field"
                required
                autoComplete="new-password"
                placeholder="Confirm your password"
              />
            </div>

            <button type="submit" disabled={loading} className="w-full btn-primary disabled:opacity-50">
              {loading ? 'Creating...' : 'Create account'}
            </button>
          </form>

          <button
            type="button"
            onClick={() => navigate('/login', { state: { from: location.state?.from } })}
            className="w-full mt-4 btn-secondary"
          >
            Already have an account? Sign in
          </button>
        </div>
      </div>
    </div>
  )
}
