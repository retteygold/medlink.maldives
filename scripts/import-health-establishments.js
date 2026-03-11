/**
 * Import/Upsert health facilities from health_establishments.csv into Supabase `hospitals` table.
 *
 * Run with: node scripts/import-health-establishments.js
 * Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env or .env.local
 */

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

function loadEnvFromFile(envPath) {
  try {
    const content = readFileSync(envPath, 'utf8')
    const lines = content.split(/\r?\n/)
    const env = {}
    for (const line of lines) {
      const trimmed = line.trim()
      if (!trimmed || trimmed.startsWith('#')) continue
      const eqIndex = trimmed.indexOf('=')
      if (eqIndex === -1) continue
      const key = trimmed.slice(0, eqIndex).trim()
      let value = trimmed.slice(eqIndex + 1).trim()
      if ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'"))) {
        value = value.slice(1, -1)
      }
      env[key] = value
    }
    return env
  } catch {
    return {}
  }
}

function inferLocationType(address) {
  if (!address) return 'Male'
  const a = address.toLowerCase()
  if (a.includes('hulhumale') || a.includes('hulhumalé')) return 'Hulhumale'
  if (a.includes('resort') || a.includes('atoll')) return 'Resort'
  if (!a.includes('male')) return 'Island'
  return 'Male'
}

function inferServices(category) {
  const cat = (category || '').toLowerCase()
  const isHospital = cat.includes('hospital')
  const isClinic = cat.includes('clinic') || cat.includes('centre') || cat.includes('center') || cat.includes('laboratory')
  return {
    has_emergency: isHospital,
    has_pharmacy: isClinic || isHospital,
    has_laboratory: isHospital || cat.includes('lab'),
    has_radiology: isHospital || cat.includes('radiology')
  }
}

function parseCsvLine(line) {
  const out = []
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

function parseCsv(content) {
  const lines = content.split(/\r?\n/).filter(Boolean)
  if (lines.length === 0) return []
  const headers = parseCsvLine(lines[0]).map(h => h.trim())

  const rows = []
  for (let i = 1; i < lines.length; i++) {
    const cols = parseCsvLine(lines[i])
    const row = {}
    for (let c = 0; c < headers.length; c++) {
      row[headers[c]] = (cols[c] ?? '').trim()
    }
    rows.push(row)
  }
  return rows
}

const envPathPrimary = join(__dirname, '../.env')
const envPathSecondary = join(__dirname, '../.env.local')
const envFromPrimary = loadEnvFromFile(envPathPrimary)
const envFromSecondary = loadEnvFromFile(envPathSecondary)

const supabaseUrl =
  process.env.SUPABASE_URL ||
  envFromPrimary.SUPABASE_URL ||
  envFromSecondary.SUPABASE_URL ||
  (process.env.VITE_SUPABASE_URL || envFromPrimary.VITE_SUPABASE_URL || envFromSecondary.VITE_SUPABASE_URL)

const supabaseServiceKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  envFromPrimary.SUPABASE_SERVICE_ROLE_KEY ||
  envFromSecondary.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in environment')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey)

const csvPath = join(__dirname, '../health_establishments.csv')
const csvContent = readFileSync(csvPath, 'utf8')
const rows = parseCsv(csvContent)

console.log('📄 Loaded CSV rows:', rows.length)

const BATCH_SIZE = 500

async function upsertInBatches(tableName, rowsToInsert) {
  let upserted = 0
  for (let i = 0; i < rowsToInsert.length; i += BATCH_SIZE) {
    const batch = rowsToInsert.slice(i, i + BATCH_SIZE)
    const { error } = await supabase.from(tableName).upsert(batch, { onConflict: 'name' })
    if (error) {
      throw new Error(`${tableName} upsert failed at batch ${i}-${i + batch.length}: ${error.message}`)
    }
    upserted += batch.length
    console.log(`✅ ${tableName}: upserted ${upserted}/${rowsToInsert.length}`)
  }
}

async function run() {
  const toUpsert = rows
    .filter(r => (r.name || '').trim().length > 0)
    .map(r => {
      const name = (r.name || '').trim()
      const category = (r.type || 'Clinic').trim() || 'Clinic'
      const address = (r.address || '').trim() || name
      const services = inferServices(category)

      return {
        name,
        address,
        contact_phone: (r.contact || '').trim() || null,
        email: (r.email || '').trim() || null,
        google_maps_url: (r.google_maps_url || '').trim() || null,
        category,
        location_type: inferLocationType(address),
        has_emergency: services.has_emergency,
        has_pharmacy: services.has_pharmacy,
        has_laboratory: services.has_laboratory,
        has_radiology: services.has_radiology,
        opening_hours: services.has_emergency ? '24 hours' : '8:00 AM - 10:00 PM',
        is_active: true
      }
    })

  await upsertInBatches('hospitals', toUpsert)
  console.log('\n🎉 Import complete!')
}

run().catch(err => {
  console.error('❌ Import failed:', err)
  process.exit(1)
})
