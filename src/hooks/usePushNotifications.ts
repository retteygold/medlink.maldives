import { useEffect, useRef, useCallback } from 'react'

export function usePushNotifications(enabled: boolean) {
  const notificationRef = useRef<Notification | null>(null)

  const requestPermission = useCallback(async () => {
    if (!('Notification' in window)) return false
    if (Notification.permission === 'granted') return true
    if (Notification.permission === 'denied') return false
    const permission = await Notification.requestPermission()
    return permission === 'granted'
  }, [])

  const showNotification = useCallback((title: string, options?: NotificationOptions) => {
    if (!enabled) return
    if (!('Notification' in window)) return
    if (Notification.permission !== 'granted') return
    if (document.visibilityState === 'visible') return // Don't show if tab is active

    // Close previous notification
    if (notificationRef.current) {
      notificationRef.current.close()
    }

    notificationRef.current = new Notification(title, {
      icon: '/icon-192x192.png',
      badge: '/icon-192x192.png',
      tag: 'medlink-chat',
      requireInteraction: false,
      ...options
    })

    notificationRef.current.onclick = () => {
      window.focus()
      notificationRef.current?.close()
    }
  }, [enabled])

  useEffect(() => {
    if (enabled) {
      requestPermission()
    }
  }, [enabled, requestPermission])

  return { showNotification, requestPermission }
}
