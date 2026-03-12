import { useEffect, useMemo, useRef, useState } from 'react'
import clsx from 'clsx'

type SnapPoint = number

export default function BottomSheet(props: {
  open: boolean
  onClose?: () => void
  initialSnap?: SnapPoint
  snapPoints?: SnapPoint[]
  disableBackdropClose?: boolean
  className?: string
  children: React.ReactNode
}) {
  const snapPoints = useMemo(() => {
    const pts = Array.isArray(props.snapPoints) ? props.snapPoints : [0.2, 0.5, 0.9]
    return pts
      .map((n) => (typeof n === 'number' && Number.isFinite(n) ? Math.min(0.98, Math.max(0.12, n)) : 0.5))
      .sort((a, b) => a - b)
  }, [props.snapPoints])

  const initialSnap = useMemo(() => {
    const v = typeof props.initialSnap === 'number' ? props.initialSnap : snapPoints[snapPoints.length - 1]
    return Math.min(0.98, Math.max(0.12, v))
  }, [props.initialSnap, snapPoints])

  const [snap, setSnap] = useState<SnapPoint>(initialSnap)
  const [dragging, setDragging] = useState(false)
  const dragStartYRef = useRef<number | null>(null)
  const startSnapRef = useRef<number>(initialSnap)

  useEffect(() => {
    if (props.open) setSnap(initialSnap)
  }, [props.open, initialSnap])

  function onPointerDown(e: React.PointerEvent) {
    if (!props.open) return
    setDragging(true)
    ;(e.currentTarget as any)?.setPointerCapture?.(e.pointerId)
    dragStartYRef.current = e.clientY
    startSnapRef.current = snap
  }

  function onPointerMove(e: React.PointerEvent) {
    if (!dragging) return
    const startY = dragStartYRef.current
    if (typeof startY !== 'number') return
    const dy = e.clientY - startY
    const vh = Math.max(1, window.innerHeight)
    const deltaSnap = dy / vh
    const next = Math.min(0.98, Math.max(0.08, startSnapRef.current - deltaSnap))
    setSnap(next)
  }

  function endDrag() {
    if (!dragging) return
    setDragging(false)
    const cur = snap
    const nearest = snapPoints.reduce((best, p) => {
      return Math.abs(p - cur) < Math.abs(best - cur) ? p : best
    }, snapPoints[0])

    if (cur < Math.min(...snapPoints) - 0.06) {
      props.onClose?.()
      return
    }
    setSnap(nearest)
  }

  const translateY = useMemo(() => {
    if (!props.open) return '110%'
    const pct = (1 - snap) * 100
    return `${pct}%`
  }, [props.open, snap])

  return (
    <div className={clsx('fixed inset-0 z-[1500]', props.open ? 'pointer-events-none' : 'pointer-events-none')}>
      {!props.disableBackdropClose && (
        <div
          className={clsx(
            'absolute inset-0 bg-black/30 transition-opacity duration-200',
            props.open ? 'opacity-100' : 'opacity-0'
          )}
          onMouseDown={() => {
            if (!props.open) return
            props.onClose?.()
          }}
          onTouchStart={() => {
            if (!props.open) return
            props.onClose?.()
          }}
        />
      )}

      <div
        className={clsx(
          'absolute left-0 right-0 bottom-0 rounded-t-3xl bg-white shadow-2xl border border-gray-200/60 pointer-events-auto',
          'transition-transform duration-200',
          dragging ? 'duration-0' : '',
          props.className
        )}
        style={{ transform: `translateY(${translateY})` }}
      >
        <div
          className="w-full flex items-center justify-center pt-3 pb-2"
          onPointerDown={onPointerDown}
          onPointerMove={onPointerMove}
          onPointerUp={endDrag}
          onPointerCancel={endDrag}
        >
          <div className="w-12 h-1.5 rounded-full bg-gray-300" />
        </div>

        <div className="px-4 pb-6 safe-bottom max-h-[85vh] overflow-auto scrollbar-hide">{props.children}</div>
      </div>
    </div>
  )
}
