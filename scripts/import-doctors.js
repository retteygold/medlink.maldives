/**
 * Import doctors from professionals_full.csv
 * Run with: node scripts/import-doctors.js
 * 
 * Filters for actual medical doctors (Medical Officer, Specialist, etc.)
 * and imports them into the doctors table.
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

// Filter for actual doctors (medical practitioners)
function isDoctor(profession) {
  if (!profession) return false
  const p = profession.toLowerCase()
  const doctorTitles = [
    'medical officer',
    'specialist',
    'consultant',
    'physician',
    'surgeon',
    'doctor',
    'radiologist',
    'cardiologist',
    'dermatologist',
    'gynecologist',
    'pediatrician',
    'anesthetist',
    'orthopedic',
    'neurologist',
    'psychiatrist',
    'dentist',
    'dental surgeon'
  ]
  return doctorTitles.some(title => p.includes(title))
}

function mapProfessionToSpecialty(profession) {
  if (!profession) return 'General Practitioner'
  const p = profession.toLowerCase()
  
  if (p.includes('cardiologist')) return 'Cardiology'
  if (p.includes('dermatologist')) return 'Dermatology'
  if (p.includes('gynecologist') || p.includes('obstetric')) return 'Obstetrics & Gynecology'
  if (p.includes('pediatrician')) return 'Pediatrics'
  if (p.includes('radiologist')) return 'Radiology'
  if (p.includes('surgeon')) return 'General Surgery'
  if (p.includes('orthopedic')) return 'Orthopedics'
  if (p.includes('neurologist')) return 'Neurology'
  if (p.includes('psychiatrist')) return 'Psychiatry'
  if (p.includes('dentist') || p.includes('dental')) return 'Dentistry'
  if (p.includes('anesthetist')) return 'Anesthesiology'
  if (p.includes('medical officer')) return 'General Practitioner'
  if (p.includes('specialist') || p.includes('consultant')) return 'Specialist'
  
  return 'General Practitioner'
}

// Load environment variables
const envPathPrimary = join(__dirname, '../.env')
const envPathSecondary = join(__dirname, '../.env.local')
const envFromPrimary = loadEnvFromFile(envPathPrimary)
const envFromSecondary = loadEnvFromFile(envPathSecondary)

const supabaseUrl =
  process.env.SUPABASE_URL ||
  envFromPrimary.SUPABASE_URL ||
  envFromSecondary.SUPABASE_URL ||
  envFromPrimary.VITE_SUPABASE_URL ||
  envFromSecondary.VITE_SUPABASE_URL

const supabaseServiceKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  envFromPrimary.SUPABASE_SERVICE_ROLE_KEY ||
  envFromSecondary.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey)

// Load and parse CSV
const csvPath = join(__dirname, '../professionals_full.csv')
const csvContent = readFileSync(csvPath, 'utf8')
const rows = parseCsv(csvContent)

console.log('📄 Total professionals in CSV:', rows.length)

// Filter for doctors only
const doctors = rows.filter(r => isDoctor(r.profession))
console.log('👨‍⚕️ Medical doctors found:', doctors.length)

// Check for existing doctors
async function fetchExistingDoctorNames() {
  const { data, error } = await supabase
    .from('doctors')
    .select('name')
    .eq('is_active', true)
  
  if (error) {
    console.error('❌ Could not fetch existing doctors:', error)
    return new Set()
  }
  
  return new Set((data || []).map(d => d.name.toLowerCase().trim()))
}

const BATCH_SIZE = 500

async function insertInBatches(tableName, rowsToInsert) {
  if (rowsToInsert.length === 0) {
    console.log(`ℹ️ No new rows to insert for ${tableName}`)
    return
  }
  
  let inserted = 0
  for (let i = 0; i < rowsToInsert.length; i += BATCH_SIZE) {
    const batch = rowsToInsert.slice(i, i + BATCH_SIZE)
    const { error } = await supabase.from(tableName).insert(batch)
    if (error) {
      console.error(`❌ Batch ${i}-${i + batch.length} failed:`, error.message)
      // Continue with next batch instead of stopping
      continue
    }
    inserted += batch.length
    console.log(`✅ ${tableName}: inserted ${inserted}/${rowsToInsert.length}`)
  }
  console.log(`\n🎉 Total inserted: ${inserted}/${rowsToInsert.length}`)
}

async function run() {
  console.log('🔍 Checking existing doctors...')
  const existingNames = await fetchExistingDoctorNames()
  console.log(`📊 Found ${existingNames.size} existing doctors`)

  const toInsert = doctors
    .filter(d => (d.name || '').trim().length > 0)
    .filter(d => !existingNames.has(d.name.toLowerCase().trim()))
    .map(d => {
      const name = (d.name || '').trim()
      const profession = (d.profession || '').trim()
      const specialty = mapProfessionToSpecialty(profession)
      
      return {
        name,
        specialty,
        is_active: true,
        // We'll need to link to hospitals later
        hospital_id: null,
        hospital_name: null
      }
    })

  console.log(`📝 New doctors to insert: ${toInsert.length}`)
  
  if (toInsert.length > 0) {
    await insertInBatches('doctors', toInsert)
  }
  
  console.log('\n📊 Final doctor count will be:', existingNames.size + toInsert.length)
}

run().catch(err => {
  console.error('❌ Import failed:', err)
  process.exit(1)
})
