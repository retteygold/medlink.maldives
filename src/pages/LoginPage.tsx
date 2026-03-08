import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

export default function LoginPage() {
  const navigate = useNavigate()
  const location = useLocation() as any

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const notice = (location.state?.notice as string | undefined) || null

  function friendlyAuthError(err: any): string {
    const status = err?.status
    const message = typeof err?.message === 'string' ? err.message : ''

    if (status === 429 || /too many requests/i.test(message)) {
      return 'Too many attempts. Please wait a few minutes and try again.'
    }

    if (/captcha/i.test(message)) {
      return 'Login is protected by CAPTCHA and is currently not configured. Please disable CAPTCHA in Supabase Auth settings or configure it.'
    }

    if (/invalid login credentials/i.test(message)) {
      return 'Invalid email or password.'
    }

    if (message) return message
    return 'Sign in failed. Please try again.'
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

    const { error: signInError } = await supabase.auth.signInWithPassword({
      email: email.trim(),
      password
    })

    if (signInError) {
      setError(friendlyAuthError(signInError))
      setLoading(false)
      return
    }

    const from = location.state?.from?.pathname || '/profile'
    navigate(from, { replace: true })
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="w-full max-w-md bg-white rounded-2xl shadow-sm p-6">
        <h1 className="text-xl font-bold text-gray-800">Sign In</h1>
        <p className="text-sm text-gray-500 mt-1">Sign in to continue</p>

        {notice && (
          <div className="mt-4 bg-green-50 border border-green-200 text-green-700 rounded-xl p-3 text-sm">
            {notice}
          </div>
        )}

        {error && (
          <div className="mt-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
            {error}
          </div>
        )}

        <form onSubmit={onSubmit} className="mt-6 space-y-4">
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
              autoComplete="current-password"
            />
          </div>

          <button type="submit" disabled={loading} className="w-full btn-primary disabled:opacity-50">
            {loading ? 'Signing in...' : 'Sign in'}
          </button>
        </form>

        <button
          type="button"
          onClick={() => navigate('/signup', { state: { from: location.state?.from } })}
          className="w-full mt-3 text-sm text-gray-600 underline"
        >
          Create an account
        </button>

        <button type="button" onClick={() => navigate('/')} className="w-full mt-3 text-sm text-gray-600 underline">
          Back to Home
        </button>
      </div>
    </div>
  )
}
