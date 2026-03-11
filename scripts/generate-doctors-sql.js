/**
 * Generate SQL insert statements for doctors from professionals_full.csv
 * Run with: node scripts/generate-doctors-sql.js
 * Then copy the output SQL and run in Supabase SQL Editor
 */

import { readFileSync, writeFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

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
    'dental surgeon',
    'ophthalmologist',
    'pathologist',
    'urologist',
    'nephrologist',
    'endocrinologist',
    'gastroenterologist',
    'pulmonologist',
    'hematologist',
    'oncologist',
    'rheumatologist',
    'immunologist',
    'geriatrician',
    'family medicine',
    'internal medicine',
    'emergency medicine',
    'sports medicine',
    'occupational medicine',
    'forensic medicine',
    'tropical medicine',
    'public health',
    'community medicine'
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
  if (p.includes('surgeon')) return p.includes('orthopedic') ? 'Orthopedic Surgery' : 'General Surgery'
  if (p.includes('orthopedic')) return 'Orthopedics'
  if (p.includes('neurologist')) return 'Neurology'
  if (p.includes('psychiatrist')) return 'Psychiatry'
  if (p.includes('dentist') || p.includes('dental')) return 'Dentistry'
  if (p.includes('anesthetist')) return 'Anesthesiology'
  if (p.includes('ophthalmologist')) return 'Ophthalmology'
  if (p.includes('pathologist')) return 'Pathology'
  if (p.includes('urologist')) return 'Urology'
  if (p.includes('nephrologist')) return 'Nephrology'
  if (p.includes('endocrinologist')) return 'Endocrinology'
  if (p.includes('gastroenterologist')) return 'Gastroenterology'
  if (p.includes('pulmonologist')) return 'Pulmonology'
  if (p.includes('hematologist')) return 'Hematology'
  if (p.includes('oncologist')) return 'Oncology'
  if (p.includes('rheumatologist')) return 'Rheumatology'
  if (p.includes('immunologist')) return 'Immunology'
  if (p.includes('geriatrician')) return 'Geriatrics'
  if (p.includes('family medicine')) return 'Family Medicine'
  if (p.includes('internal medicine')) return 'Internal Medicine'
  if (p.includes('emergency medicine')) return 'Emergency Medicine'
  if (p.includes('sports medicine')) return 'Sports Medicine'
  if (p.includes('tropical medicine')) return 'Tropical Medicine'
  if (p.includes('public health') || p.includes('community medicine')) return 'Public Health'
  if (p.includes('medical officer')) return 'General Practitioner'
  if (p.includes('specialist') || p.includes('consultant')) return 'Specialist'
  if (p.includes('physician')) return 'General Practitioner'
  
  return 'General Practitioner'
}

function escapeSqlString(str) {
  if (!str) return ''
  return str.replace(/'/g, "''").replace(/\\/g, '\\\\')
}

const csvPath = join(__dirname, '../professionals_full.csv')
const csvContent = readFileSync(csvPath, 'utf8')
const rows = parseCsv(csvContent)

console.log('📄 Total professionals in CSV:', rows.length)

// Filter for doctors only and deduplicate by name
const doctorsMap = new Map()
rows.forEach(r => {
  if (!isDoctor(r.profession)) return
  const name = (r.name || '').trim()
  if (!name) return
  
  // Keep first occurrence of each name
  if (!doctorsMap.has(name)) {
    doctorsMap.set(name, r)
  }
})

const doctors = Array.from(doctorsMap.values())
console.log('👨‍⚕️ Unique medical doctors found:', doctors.length)

// Generate SQL
let sql = `-- Generated SQL to insert doctors from professionals_full.csv\n`
sql += `-- Total doctors: ${doctors.length}\n\n`
sql += `BEGIN;\n\n`

for (const d of doctors) {
  const name = escapeSqlString((d.name || '').trim())
  const profession = (d.profession || '').trim()
  const specialty = escapeSqlString(mapProfessionToSpecialty(profession))
  const hospitalName = 'Independent Practice' // Default when no hospital specified
  
  sql += `INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)\n`
  sql += `VALUES ('${name}', '${specialty}', true, NULL, '${hospitalName}')\n`
  sql += `ON CONFLICT (name) DO NOTHING;\n\n`
}

sql += `COMMIT;\n`

const outputPath = join(__dirname, '../insert_doctors_from_csv.sql')
writeFileSync(outputPath, sql, 'utf8')

console.log(`✅ Generated SQL file: insert_doctors_from_csv.sql`)
console.log(`📝 Contains ${doctors.length} INSERT statements`)
console.log(`\n📋 Next steps:`)
console.log(`1. Open insert_doctors_from_csv.sql in Notepad`)
console.log(`2. Copy all content (Ctrl+A, Ctrl+C)`)
console.log(`3. Go to Supabase SQL Editor`)
console.log(`4. Paste and run`)
