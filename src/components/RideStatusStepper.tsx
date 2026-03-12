import clsx from 'clsx'

type Step = {
  key: string
  label: string
}

const steps: Step[] = [
  { key: 'open', label: 'Finding driver' },
  { key: 'matched', label: 'Matched' },
  { key: 'accepted', label: 'Driver accepted' },
  { key: 'arrived', label: 'Arrived' },
  { key: 'started', label: 'In trip' },
  { key: 'finished', label: 'Finished' }
]

function stepIndex(status: string) {
  const s = String(status || '').toLowerCase()
  const i = steps.findIndex((x) => x.key === s)
  return i >= 0 ? i : 0
}

export default function RideStatusStepper(props: { status: string; language?: 'en' | 'dv' }) {
  const idx = stepIndex(props.status)

  return (
    <div className="w-full">
      <div className="flex items-center justify-between gap-2">
        {steps.map((s, i) => {
          const done = i < idx
          const active = i === idx
          return (
            <div key={s.key} className="flex-1 flex flex-col items-center">
              <div
                className={clsx(
                  'w-3 h-3 rounded-full',
                  done ? 'bg-emerald-600' : active ? 'bg-medical-600' : 'bg-gray-300'
                )}
              />
              <div className={clsx('mt-1 text-[10px] text-center leading-tight', active ? 'text-gray-900' : 'text-gray-500')}>
                {props.language === 'dv' ? '' : s.label}
              </div>
            </div>
          )
        })}
      </div>
      <div className="mt-2 h-1 rounded-full bg-gray-200 overflow-hidden">
        <div
          className="h-full bg-medical-600 transition-all"
          style={{ width: `${Math.round(((idx + 1) / steps.length) * 100)}%` }}
        />
      </div>
    </div>
  )
}
