/**
 * Seed Supabase from local medlink_database_complete.json
 * Run with: node scripts/seed-supabase.js
 * Make sure SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are set in .env
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

console.log('🔎 Env check:', {
  envPathPrimaryFound: Object.prototype.hasOwnProperty.call(envFromPrimary, 'SUPABASE_URL') || Object.prototype.hasOwnProperty.call(envFromPrimary, 'SUPABASE_SERVICE_ROLE_KEY'),
  envPathSecondaryFound: Object.prototype.hasOwnProperty.call(envFromSecondary, 'SUPABASE_URL') || Object.prototype.hasOwnProperty.call(envFromSecondary, 'SUPABASE_SERVICE_ROLE_KEY'),
  hasSupabaseUrl: Boolean(supabaseUrl),
  hasServiceRoleKey: Boolean(supabaseServiceKey)
})

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in environment')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey)

// Load local JSON
const jsonPath = join(__dirname, '../data/medlink_database_complete.json')
const data = JSON.parse(readFileSync(jsonPath, 'utf8'))

console.log('📂 Loaded local JSON:', {
  facilities: data.facilities?.length || 0,
  doctors: data.doctors?.length || 0,
  specialties: data.specialties?.length || 0
})

const SHOULD_RESET = process.argv.includes('--reset')
const BATCH_SIZE = 500

async function insertInBatches(tableName, rows) {
  let inserted = 0
  for (let i = 0; i < rows.length; i += BATCH_SIZE) {
    const batch = rows.slice(i, i + BATCH_SIZE)
    const { error } = await supabase.from(tableName).insert(batch)
    if (error) {
      throw new Error(`${tableName} insert failed at batch ${i}-${i + batch.length}: ${error.message}`)
    }
    inserted += batch.length
    console.log(`✅ ${tableName}: inserted ${inserted}/${rows.length}`)
  }
}

async function resetTable(tableName) {
  // Supabase requires a filter for deletes; this matches all rows.
  const { error } = await supabase.from(tableName).delete().not('id', 'is', null)
  if (error) {
    throw new Error(`${tableName} reset failed: ${error.message}`)
  }
  console.log(`🧹 Cleared table: ${tableName}`)
}

// Helpers
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
  const isClinic = cat.includes('clinic')
  return {
    has_emergency: isHospital,
    has_pharmacy: isClinic || isHospital,
    has_laboratory: isHospital,
    has_radiology: isHospital
  }
}

// Seed functions
async function seedSpecialties() {
  console.log('\n🌱 Seeding specialties...')
  const toInsert = data.specialties.map(s => ({
    name: s.name,
    category: s.category || 'Medical'
  }))
  const { error } = await supabase.from('specialties').upsert(toInsert, { onConflict: 'name' })
  if (error) {
    console.error('❌ Specialties error:', error)
  } else {
    console.log(`✅ Inserted ${toInsert.length} specialties`)
  }
}

async function seedHospitals() {
  console.log('\n🏥 Seeding hospitals/facilities...')
  const toInsert = data.facilities.map(f => {
    const services = inferServices(f.category)
    return {
      name: f.name,
      registration_number: f.registration_number || null,
      operating_license_no: f.operating_license_no || null,
      address: f.address,
      contact_phone: f.contact_no || null,
      email: f.email || null,
      category: f.category || 'Clinic',
      location_type: inferLocationType(f.address),
      has_emergency: services.has_emergency,
      has_pharmacy: services.has_pharmacy,
      has_laboratory: services.has_laboratory,
      has_radiology: services.has_radiology,
      opening_hours: services.has_emergency ? '24 hours' : '8:00 AM - 10:00 PM',
      is_active: f.is_active !== false,
      rating: 4.0 + Math.random() * 1.0,
      review_count: Math.floor(Math.random() * 500)
    }
  })
  await insertInBatches('hospitals', toInsert)
}

async function seedDoctors() {
  console.log('\n👨‍⚕️ Seeding doctors...')
  const toInsert = data.doctors.map(d => ({
    name: d.name,
    specialty: d.specialty,
    hospital_id: null, // You can map this later if you have hospital IDs
    hospital_name: d.hospital,
    qualifications: d.qualification ? [d.qualification] : [],
    contact_phone: null,
    email: null,
    about: `Doctor at ${d.hospital}`,
    rating: 4.0 + Math.random() * 1.0,
    review_count: Math.floor(Math.random() * 200),
    is_active: d.is_active !== false
  }))
  await insertInBatches('doctors', toInsert)
}

// Optional: Link doctors to hospitals by name (after both are inserted)
async function linkDoctorsToHospitals() {
  console.log('\n🔗 Linking doctors to hospitals by name...')
  const { data: hospitals, error: hospError } = await supabase
    .from('hospitals')
    .select('id, name')
    .eq('is_active', true)
  if (hospError) {
    console.error('❌ Could not fetch hospitals for linking:', hospError)
    return
  }
  const nameToId = {}
  for (const h of hospitals) {
    nameToId[h.name.toLowerCase()] = h.id
  }
  const { data: doctors, error: docError } = await supabase
    .from('doctors')
    .select('id, hospital_name')
    .eq('is_active', true)
  if (docError) {
    console.error('❌ Could not fetch doctors for linking:', docError)
    return
  }
  let linked = 0
  for (const doc of doctors) {
    const hid = nameToId[doc.hospital_name?.toLowerCase()]
    if (hid) {
      const { error } = await supabase
        .from('doctors')
        .update({ hospital_id: hid })
        .eq('id', doc.id)
      if (!error) linked++
    }
  }
  console.log(`✅ Linked ${linked} doctors to hospitals`)
}

// Main
async function run() {
  try {
    if (SHOULD_RESET) {
      console.log('\n⚠️ Reset mode enabled: clearing existing rows before seeding...')
      await resetTable('answers')
      await resetTable('questions')
      await resetTable('doctor_reviews')
      await resetTable('doctors')
      await resetTable('hospitals')
      // Keep specialties idempotent via upsert; optionally clear it too
    }

    await seedSpecialties()
    await seedHospitals()
    await seedDoctors()
    await linkDoctorsToHospitals()
    console.log('\n🎉 Seeding complete!')
  } catch (err) {
    console.error('❌ Seeding failed:', err)
    process.exit(1)
  }
}

run()
