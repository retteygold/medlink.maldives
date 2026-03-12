import { readFileSync } from 'fs'
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

const deny = [
  'nurse',
  'nursing',
  'midwife',
  'assistant',
  'technician',
  'technologist',
  'therapist',
  'physiotherapist',
  'psychologist',
  'psychological',
  'optometry',
  'laboratory',
  'radiography',
  'pharmacy'
]

const allow = [
  'mbbs',
  'mbchb',
  'md',
  'ms',
  'mrcp',
  'frcs',
  'fcps',
  'specialist',
  'consultant',
  'physician',
  'surgeon',
  'doctor',
  'dentist',
  'dental surgeon',
  'dental officer',
  'radiologist',
  'cardiologist',
  'dermatologist',
  'gynecologist',
  'pediatrician',
  'anesthetist',
  'orthopedic',
  'neurologist',
  'psychiatrist',
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

const csvPath = join(__dirname, '../professionals_full.csv')
const raw = readFileSync(csvPath, 'utf8')
const lines = raw.split(/\r?\n/).filter(Boolean)
const headers = parseCsvLine(lines[0]).map(x => x.trim())
const idxProfession = headers.indexOf('profession')
const idxName = headers.indexOf('name')

if (idxProfession < 0 || idxName < 0) {
  console.error('CSV missing required columns: name/profession')
  process.exit(1)
}

let total = 0
let excludedMedicalOfficer = 0
let excludedDenied = 0
let matchedRows = 0
const uniqueNames = new Set()

for (let i = 1; i < lines.length; i++) {
  const cols = parseCsvLine(lines[i])
  const name = (cols[idxName] ?? '').trim()
  const profession = (cols[idxProfession] ?? '').trim()
  if (!name || !profession) continue

  total++
  const p = profession.toLowerCase()

  // Option B: exclude Medical Officer (except Dental Officer)
  if (p.includes('medical officer') && !p.includes('dental officer')) {
    excludedMedicalOfficer++
    continue
  }

  if (deny.some(x => p.includes(x))) {
    excludedDenied++
    continue
  }

  if (!allow.some(x => p.includes(x))) continue

  matchedRows++
  uniqueNames.add(name.toLowerCase().trim())
}

console.log(
  JSON.stringify({
    totalCsvRows: total,
    excludedMedicalOfficerRows: excludedMedicalOfficer,
    excludedDeniedRoleRows: excludedDenied,
    matchedDoctorRows: matchedRows,
    uniqueDoctorNames: uniqueNames.size
  })
)
