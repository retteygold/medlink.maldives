import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

type UserRole = 'need_service' | 'provide_service'

export default function SignupPage() {
  const navigate = useNavigate()
  const location = useLocation() as any

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [role, setRole] = useState<UserRole>('need_service')
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
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="w-full max-w-md bg-white rounded-2xl shadow-sm p-6">
        <h1 className="text-xl font-bold text-gray-800">Create Account</h1>
        <p className="text-sm text-gray-500 mt-1">Choose your role and sign up</p>

        {error && (
          <div className="mt-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
            {error}
          </div>
        )}

        <form onSubmit={onSubmit} className="mt-6 space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">I am here to</label>
            <div className="grid grid-cols-1 gap-2">
              <button
                type="button"
                onClick={() => setRole('need_service')}
                className={`p-3 rounded-xl border text-left ${
                  role === 'need_service' ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white'
                }`}
              >
                <div className="font-medium text-gray-800">Request medicine help</div>
                <div className="text-xs text-gray-500">I need medicine from abroad / not available locally</div>
              </button>
              <button
                type="button"
                onClick={() => setRole('provide_service')}
                className={`p-3 rounded-xl border text-left ${
                  role === 'provide_service' ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white'
                }`}
              >
                <div className="font-medium text-gray-800">Help others bring medicine</div>
                <div className="text-xs text-gray-500">I can purchase abroad and deliver</div>
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
            />
          </div>

          <button type="submit" disabled={loading} className="w-full btn-primary disabled:opacity-50">
            {loading ? 'Creating...' : 'Create account'}
          </button>
        </form>

        <button type="button" onClick={() => navigate('/login', { state: { from: location.state?.from } })} className="w-full mt-3 text-sm text-gray-600 underline">
          Already have an account? Sign in
        </button>

        <button type="button" onClick={() => navigate('/')} className="w-full mt-3 text-sm text-gray-600 underline">
          Back to Home
        </button>
      </div>
    </div>
  )
}
