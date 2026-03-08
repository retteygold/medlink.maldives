import { useEffect, useState } from 'react'
import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { supabase } from '../lib/supabase'

export default function RequireAdmin() {
  const location = useLocation()
  const [checking, setChecking] = useState(true)
  const [signedIn, setSignedIn] = useState(false)

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      setSignedIn(Boolean(data.session))
      setChecking(false)
    }

    const { data: sub } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!mounted) return
      setSignedIn(Boolean(session))
      setChecking(false)
    })

    check()

    return () => {
      mounted = false
      sub.subscription.unsubscribe()
    }
  }, [])

  if (checking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Loading...</p>
      </div>
    )
  }

  if (!signedIn) {
    return <Navigate to="/admin/login" replace state={{ from: location }} />
  }

  return <Outlet />
}
