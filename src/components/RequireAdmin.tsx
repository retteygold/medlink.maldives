import { useEffect, useState } from 'react'
import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { supabase } from '../lib/supabase'

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

export default function RequireAdmin() {
  const location = useLocation()
  const [checking, setChecking] = useState(true)
  const [signedIn, setSignedIn] = useState(false)
  const [isAdmin, setIsAdmin] = useState(false)

  useEffect(() => {
    let mounted = true

    async function check() {
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      const session = data.session
      setSignedIn(Boolean(session))
      if (session?.user?.id) {
        const ok = await checkAdmin(session.user.id)
        if (!mounted) return
        setIsAdmin(ok)
      } else {
        setIsAdmin(false)
      }
      setChecking(false)
    }

    const { data: sub } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!mounted) return
      setSignedIn(Boolean(session))
      if (session?.user?.id) {
        checkAdmin(session.user.id).then((ok) => {
          if (!mounted) return
          setIsAdmin(ok)
          setChecking(false)
        })
        return
      }
      setIsAdmin(false)
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

  if (!isAdmin) {
    return <Navigate to="/profile" replace />
  }

  return <Outlet />
}
