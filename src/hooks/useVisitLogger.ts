import { useEffect, useRef } from 'react'
import { useLocation } from 'react-router-dom'
import { logAppVisit } from '../lib/dataService'

// Generate or retrieve session ID
function getSessionId(): string {
  const key = 'medlink_session_id'
  let sessionId = localStorage.getItem(key)
  if (!sessionId) {
    sessionId = `${Date.now()}-${Math.random().toString(36).slice(2, 11)}`
    localStorage.setItem(key, sessionId)
  }
  return sessionId
}

// Hook to log page visits
export function useVisitLogger() {
  const location = useLocation()
  const lastPath = useRef<string>('')

  useEffect(() => {
    const currentPath = location.pathname + location.search
    
    // Don't log the same path twice in a row (prevents double logging)
    if (currentPath === lastPath.current) return
    lastPath.current = currentPath

    // Don't log admin paths to avoid cluttering analytics
    if (currentPath.startsWith('/admin')) return

    const sessionId = getSessionId()
    const userAgent = navigator.userAgent
    const referrer = document.referrer

    // Log visit (async, don't block rendering)
    logAppVisit(currentPath, sessionId, userAgent, referrer).catch(() => {
      // Silently fail - analytics should never break the app
    })
  }, [location])
}
