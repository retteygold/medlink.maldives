import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { ChevronLeft, ExternalLink, MapPin, Phone, Search } from 'lucide-react'
import { useLanguage } from '../lib/languageContext'

type Pharmacy = {
  name: string
  address: string
  contact: string
  atoll: string
  googleMapsUrl: string
}

function parseCsvLine(line: string): string[] {
  const out: string[] = []
  let cur = ''
  let inQuotes = false

  for (let i = 0; i < line.length; i++) {
    const ch = line[i]

    if (ch === '"') {
      if (inQuotes && line[i + 1] === '"') {
        cur += '"'
        i++
      } else {
        inQuotes = !inQuotes
      }
      continue
    }

    if (ch === ',' && !inQuotes) {
      out.push(cur)
      cur = ''
      continue
    }

    cur += ch
  }

  out.push(cur)
  return out
}

function normalizeText(value: string) {
  return (value || '').toLowerCase().trim()
}

export default function PharmaciesPage() {
  const { t, language } = useLanguage()

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [pharmacies, setPharmacies] = useState<Pharmacy[]>([])

  const [searchQuery, setSearchQuery] = useState('')
  const [selectedAtoll, setSelectedAtoll] = useState('All')

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    setError(null)

    try {
      const res = await fetch('/maldives_pharmacies.csv', { cache: 'no-store' })
      if (!res.ok) throw new Error('Failed to load pharmacies list')
      const text = await res.text()

      const lines = text.split(/\r?\n/).filter(Boolean)
      if (lines.length <= 1) {
        setPharmacies([])
        return
      }

      const headers = parseCsvLine(lines[0]).map(h => normalizeText(h))
      const idxName = headers.indexOf('name')
      const idxAddress = headers.indexOf('address')
      const idxContact = headers.indexOf('contact')
      const idxAtoll = headers.indexOf('atoll')
      const idxMaps = headers.indexOf('google_maps_url')

      const rows: Pharmacy[] = []

      for (let i = 1; i < lines.length; i++) {
        const cols = parseCsvLine(lines[i])
        const name = (cols[idxName] ?? '').trim()
        if (!name) continue

        rows.push({
          name,
          address: (cols[idxAddress] ?? '').trim(),
          contact: (cols[idxContact] ?? '').trim(),
          atoll: (cols[idxAtoll] ?? '').trim(),
          googleMapsUrl: (cols[idxMaps] ?? '').trim()
        })
      }

      setPharmacies(rows)
    } catch (e: any) {
      setError(e?.message || 'Failed to load pharmacies')
      setPharmacies([])
    } finally {
      setLoading(false)
    }
  }

  const atolls = useMemo(() => {
    const s = new Set<string>()
    for (const p of pharmacies) {
      const a = (p.atoll || '').trim()
      if (a) s.add(a)
    }
    return ['All', ...Array.from(s).sort((a, b) => a.localeCompare(b))]
  }, [pharmacies])

  const filtered = useMemo(() => {
    const q = normalizeText(searchQuery)
    return pharmacies
      .filter(p => {
        if (selectedAtoll !== 'All' && (p.atoll || '').trim() !== selectedAtoll) return false
        if (!q) return true
        const hay = `${p.name} ${p.address} ${p.contact} ${p.atoll}`.toLowerCase()
        return hay.includes(q)
      })
      .sort((a, b) => a.name.localeCompare(b.name))
  }, [pharmacies, searchQuery, selectedAtoll])

  return (
    <div className={`min-h-screen pb-24 ${language === 'dv' ? 'rtl-layout' : ''}`} dir={language === 'dv' ? 'rtl' : 'ltr'}>
      <div className="gradient-header px-4 pt-12 pb-6 rounded-b-3xl">
        <div className="flex items-center justify-between">
          <Link
            to="/"
            className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center"
            aria-label="Back"
          >
            <ChevronLeft size={20} className="text-white" />
          </Link>
          <h1 className={`text-white text-xl font-bold ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('nav.pharmacies') || 'Pharmacies'}</h1>
          <div className="w-10" />
        </div>

        <div className="mt-4 relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={18} />
          <input
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder={t('home.searchPlaceholder')}
            className="w-full pl-11 pr-4 py-3 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none shadow-lg"
          />
        </div>

        <div className="mt-3">
          <select
            value={selectedAtoll}
            onChange={(e) => setSelectedAtoll(e.target.value)}
            className="w-full px-4 py-3 rounded-xl bg-white/90 text-gray-800 focus:outline-none"
          >
            {atolls.map(a => (
              <option key={a} value={a}>
                {a}
              </option>
            ))}
          </select>
        </div>
      </div>

      <div className="px-4 mt-6">
        {loading ? (
          <div className={`text-sm text-gray-500 ${language === 'dv' ? 'dhivehi-font' : ''}`}>{t('doctors.loading')}</div>
        ) : error ? (
          <div className="text-sm text-red-600">{error}</div>
        ) : (
          <div className="space-y-3">
            {filtered.map((p) => (
              <div key={`${p.name}-${p.address}`} className="card p-4">
                <div className="flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <div className={`font-bold text-gray-800 truncate ${language === 'dv' ? 'dhivehi-font' : ''}`}>{p.name}</div>
                    <div className="mt-1 space-y-1 text-sm text-gray-600">
                      {p.atoll ? (
                        <div className="flex items-center gap-2">
                          <MapPin size={14} className="text-medical-600" />
                          <span className="truncate">{p.atoll}</span>
                        </div>
                      ) : null}
                      {p.address ? <div className="text-gray-500 truncate">{p.address}</div> : null}
                    </div>
                  </div>

                  <div className="flex items-center gap-2 shrink-0">
                    {p.contact && normalizeText(p.contact) !== 'not available' ? (
                      <a
                        href={`tel:${p.contact.replace(/\s+/g, ' ').trim()}`}
                        className="w-10 h-10 rounded-xl bg-medical-50 flex items-center justify-center border border-medical-100"
                        aria-label="Call"
                      >
                        <Phone size={18} className="text-medical-700" />
                      </a>
                    ) : null}

                    {p.googleMapsUrl ? (
                      <a
                        href={p.googleMapsUrl}
                        target="_blank"
                        rel="noreferrer"
                        className="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center border border-gray-100"
                        aria-label="Open map"
                      >
                        <ExternalLink size={18} className="text-gray-700" />
                      </a>
                    ) : null}
                  </div>
                </div>
              </div>
            ))}

            {filtered.length === 0 ? (
              <div className="text-sm text-gray-500">No pharmacies found.</div>
            ) : null}
          </div>
        )}
      </div>
    </div>
  )
}
