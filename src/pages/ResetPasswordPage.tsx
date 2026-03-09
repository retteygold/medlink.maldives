import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'

export default function ResetPasswordPage() {
  const navigate = useNavigate()
  const [checking, setChecking] = useState(true)
  const [hasSession, setHasSession] = useState(false)
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [notice, setNotice] = useState<string | null>(null)

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      setHasSession(Boolean(data.session))
      setChecking(false)
    }

    check()

    return () => {
      mounted = false
    }
  }, [])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    setNotice(null)

    if (!password || password.length < 6) {
      setError('Password must be at least 6 characters.')
      return
    }

    if (password !== confirmPassword) {
      setError('Passwords do not match.')
      return
    }

    setSaving(true)

    const { error: updateError } = await supabase.auth.updateUser({
      password
    })

    if (updateError) {
      setError(updateError.message)
      setSaving(false)
      return
    }

    setNotice('Password updated. You can now sign in with your new password.')
    setSaving(false)

    navigate('/login', {
      replace: true,
      state: { notice: 'Password updated. Please sign in with your new password.' }
    })
  }

  if (checking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Loading...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="gradient-header px-4 pt-12 pb-8 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <button type="button" onClick={() => navigate('/login')} className="text-white/80 text-sm font-medium">
            Back
          </button>
          <div className="text-white/80 text-sm">MedLink</div>
        </div>

        <div className="mt-6">
          <h1 className="text-2xl font-bold text-white">Reset Password</h1>
          <p className="text-white/80 text-sm mt-1">Choose a new password for your account</p>
        </div>
      </div>

      <div className="px-4 -mt-6">
        <div className="bg-white rounded-2xl shadow-sm p-6">
          {!hasSession && (
            <div className="mb-4 bg-yellow-50 border border-yellow-200 text-yellow-800 rounded-xl p-3 text-sm">
              This reset link is missing or expired. Please request a new password reset email from the login screen.
            </div>
          )}

          {notice && (
            <div className="mb-4 bg-green-50 border border-green-200 text-green-700 rounded-xl p-3 text-sm">{notice}</div>
          )}

          {error && (
            <div className="mb-4 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">{error}</div>
          )}

          <form onSubmit={onSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">New password</label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="input-field"
                required
                autoComplete="new-password"
                placeholder="Enter new password"
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
                placeholder="Confirm new password"
              />
            </div>

            <button
              type="submit"
              disabled={saving || !hasSession}
              className="w-full btn-primary disabled:opacity-50"
            >
              {saving ? 'Updating...' : 'Update password'}
            </button>
          </form>
        </div>
      </div>
    </div>
  )
}
