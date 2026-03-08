import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../../lib/supabase'

async function checkAdmin(uid: string): Promise<boolean> {
  try {
    const { data, error } = await supabase
      .from('admin_users')
      .select('*')
      .eq('id', uid)
      .maybeSingle()
    if (error) throw error
    return Boolean(data)
  } catch (err: any) {
    const message = typeof err?.message === 'string' ? err.message : ''
    if (!/Could not find the 'id' column/i.test(message)) {
      return false
    }

    const { data } = await supabase
      .from('admin_users')
      .select('*')
      .eq('user_id', uid)
      .maybeSingle()
    return Boolean(data)
  }
}

export default function AdminLogin() {
  const navigate = useNavigate()
  const location = useLocation() as any

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      if (data.session?.user?.id) {
        const ok = await checkAdmin(data.session.user.id)
        if (!mounted) return
        if (ok) {
          navigate('/admin', { replace: true })
          return
        }
        await supabase.auth.signOut()
        setError('This account is not allowed to access admin.')
      }
    }

    check()

    return () => {
      mounted = false
    }
  }, [navigate])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)

    const { error: signInError } = await supabase.auth.signInWithPassword({
      email: email.trim(),
      password
    })

    if (signInError) {
      setError(signInError.message)
      setLoading(false)
      return
    }

    const { data: sessionData } = await supabase.auth.getSession()
    const uid = sessionData.session?.user?.id
    if (!uid) {
      setError('Login failed. Please try again.')
      setLoading(false)
      return
    }

    const ok = await checkAdmin(uid)
    if (!ok) {
      await supabase.auth.signOut()
      setError('This account is not allowed to access admin.')
      setLoading(false)
      return
    }

    const from = location.state?.from?.pathname || '/admin'
    navigate(from, { replace: true })
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-8 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <button
            type="button"
            onClick={() => navigate('/')}
            className="text-white/80 text-sm font-medium"
          >
            Back
          </button>
          <div className="text-white/80 text-sm">Admin</div>
        </div>

        <div className="mt-6 flex items-center gap-4">
          <div className="flex-1">
            <h1 className="text-2xl font-bold">Admin Login</h1>
            <p className="text-white/80 text-sm mt-1">Sign in to manage content</p>
          </div>
          <img
            src="/images/storyset/Health professional team-amico.svg"
            alt="Admin"
            className="w-24 h-24 object-contain drop-shadow-lg"
          />
        </div>
      </div>

      <div className="px-4 -mt-6">
        <div className="w-full max-w-md mx-auto bg-white rounded-2xl shadow-sm p-6">
          {error && (
            <div className="mb-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
              {error}
            </div>
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
                placeholder="admin@example.com"
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

            <button type="submit" disabled={loading} className="w-full btn-primary disabled:opacity-50">
              {loading ? 'Signing in...' : 'Sign in'}
            </button>
          </form>
        </div>
      </div>
    </div>
  )
}
