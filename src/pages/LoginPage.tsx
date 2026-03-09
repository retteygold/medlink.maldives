import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

export default function LoginPage() {
  const navigate = useNavigate()
  const location = useLocation() as any

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [resending, setResending] = useState(false)
  const [resetting, setResetting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [notice2, setNotice2] = useState<string | null>(null)
  const [showResend, setShowResend] = useState(false)
  const notice = (location.state?.notice as string | undefined) || null

  const resetRedirectTo = `${window.location.origin}/reset-password`

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

    if (/email not confirmed/i.test(message)) {
      return 'Email not confirmed. Please check your inbox (and spam) for the confirmation link.'
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
    setNotice2(null)
    setShowResend(false)

    const { error: signInError } = await supabase.auth.signInWithPassword({
      email: email.trim(),
      password
    })

    if (signInError) {
      setError(friendlyAuthError(signInError))
      const message = typeof (signInError as any)?.message === 'string' ? (signInError as any).message : ''
      if (/email not confirmed/i.test(message)) {
        setShowResend(true)
      }
      setLoading(false)
      return
    }

    const from = location.state?.from?.pathname || '/profile'
    navigate(from, { replace: true })
  }

  async function onResendConfirmation() {
    const cleanEmail = email.trim()
    if (!cleanEmail) return

    setResending(true)
    setError(null)
    setNotice2(null)

    const { error: resendError } = await supabase.auth.resend({
      type: 'signup',
      email: cleanEmail
    })

    if (resendError) {
      setError(friendlyAuthError(resendError))
      setResending(false)
      return
    }

    setNotice2('Confirmation email sent. Please check your inbox (and spam) and open the link to confirm your email.')
    setResending(false)
  }

  async function onResetPassword() {
    const cleanEmail = email.trim()
    if (!cleanEmail) return

    setResetting(true)
    setError(null)
    setNotice2(null)

    const { error: resetError } = await supabase.auth.resetPasswordForEmail(cleanEmail, {
      redirectTo: resetRedirectTo
    })

    if (resetError) {
      setError(friendlyAuthError(resetError))
      setResetting(false)
      return
    }

    setNotice2('Password reset email sent. Please open the link in your email to set a new password.')
    setResetting(false)
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
            <h1 className="text-2xl font-bold text-white">Sign In</h1>
            <p className="text-white/80 text-sm mt-1">Sign in to continue to Medicine Help</p>
          </div>
          <img
            src="/images/storyset/Online Doctor-pana.svg"
            alt="Login"
            className="w-24 h-24 object-contain drop-shadow-lg"
          />
        </div>
      </div>

      <div className="px-4 -mt-6">
        <div className="bg-white rounded-2xl shadow-sm p-6">
          {notice && (
            <div className="mb-4 bg-green-50 border border-green-200 text-green-700 rounded-xl p-3 text-sm">
              {notice}
            </div>
          )}

          {notice2 && (
            <div className="mb-4 bg-green-50 border border-green-200 text-green-700 rounded-xl p-3 text-sm">
              {notice2}
            </div>
          )}

          {error && (
            <div className="mb-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
              {error}
            </div>
          )}

          {showResend && (
            <button
              type="button"
              onClick={onResendConfirmation}
              disabled={resending || !email.trim()}
              className="w-full mb-4 btn-secondary disabled:opacity-50"
            >
              {resending ? 'Sending confirmation email...' : 'Resend confirmation email'}
            </button>
          )}

          <form onSubmit={onSubmit} className="space-y-4">
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
                autoComplete="current-password"
                placeholder="Your password"
              />
            </div>

            <button
              type="button"
              onClick={onResetPassword}
              disabled={resetting || !email.trim()}
              className="w-full btn-secondary disabled:opacity-50"
            >
              {resetting ? 'Sending reset email...' : 'Forgot password? Reset'}
            </button>

            <button type="submit" disabled={loading} className="w-full btn-primary disabled:opacity-50">
              {loading ? 'Signing in...' : 'Sign in'}
            </button>
          </form>

          <div className="mt-5 text-sm text-gray-600 text-center">
            Don’t have an account?
          </div>
          <button
            type="button"
            onClick={() => navigate('/signup', { state: { from: location.state?.from } })}
            className="w-full mt-3 btn-secondary"
          >
            Create an account
          </button>
        </div>
      </div>
    </div>
  )
}
