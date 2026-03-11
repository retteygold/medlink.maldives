/**
 * Generate SQL insert statements from health_establishments.csv
 * Run with: node scripts/generate-hospitals-sql.js
 * Then copy the output SQL and run in Supabase SQL Editor
 */

import { readFileSync, writeFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

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

function escapeSqlString(str) {
  if (!str) return ''
  return str.replace(/'/g, "''").replace(/\\/g, '\\\\')
}

const csvPath = join(__dirname, '../health_establishments.csv')
const csvContent = readFileSync(csvPath, 'utf8')
const rows = parseCsv(csvContent)

console.log('📄 Loaded CSV rows:', rows.length)

const hospitals = rows
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

// Generate SQL
let sql = `-- Generated SQL to insert hospitals from health_establishments.csv\n`
sql += `-- Total hospitals: ${hospitals.length}\n\n`
sql += `BEGIN;\n\n`

for (const h of hospitals) {
  sql += `INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)\n`
  sql += `VALUES ('${escapeSqlString(h.name)}', '${escapeSqlString(h.address)}', ${h.contact_phone ? `'${escapeSqlString(h.contact_phone)}'` : 'NULL'}, ${h.email ? `'${escapeSqlString(h.email)}'` : 'NULL'}, ${h.google_maps_url ? `'${escapeSqlString(h.google_maps_url)}'` : 'NULL'}, '${escapeSqlString(h.category)}', '${h.location_type}', ${h.has_emergency}, ${h.has_pharmacy}, ${h.has_laboratory}, ${h.has_radiology}, '${escapeSqlString(h.opening_hours)}', ${h.is_active})\n`
  sql += `ON CONFLICT (name) DO NOTHING;\n\n`
}

sql += `COMMIT;\n`

const outputPath = join(__dirname, '../insert_hospitals_from_csv.sql')
writeFileSync(outputPath, sql, 'utf8')

console.log(`✅ Generated SQL file: insert_hospitals_from_csv.sql`)
console.log(`📝 Contains ${hospitals.length} INSERT statements`)
console.log(`\n📋 Next steps:`)
console.log(`1. Open insert_hospitals_from_csv.sql in Notepad`)
console.log(`2. Copy all content (Ctrl+A, Ctrl+C)`)
console.log(`3. Go to Supabase SQL Editor`)
console.log(`4. Paste and run`)
