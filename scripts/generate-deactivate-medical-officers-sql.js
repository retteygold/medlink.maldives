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
  if (lines.length === 0) return { headers: [], rows: [] }
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
  return { headers, rows }
}

function escapeSqlString(str) {
  if (!str) return ''
  return str.replace(/'/g, "''").replace(/\\/g, '\\\\')
}

function isMedicalOfficerButNotDental(profession) {
  const p = (profession || '').toLowerCase()
  if (!p.includes('medical officer')) return false
  if (p.includes('dental officer')) return false
  return true
}

const csvPath = join(__dirname, '../professionals_full.csv')
const csvContent = readFileSync(csvPath, 'utf8')
const { rows } = parseCsv(csvContent)

const names = new Set()
for (const r of rows) {
  if (!isMedicalOfficerButNotDental(r.profession)) continue
  const name = (r.name || '').trim()
  if (!name) continue
  names.add(name)
}

const list = Array.from(names)
console.log('Medical Officer names (excluding Dental Officer):', list.length)

const CHUNK = 500
let sql = `-- Deactivate Medical Officer rows in doctors table\n`
sql += `-- Generated from professionals_full.csv\n`
sql += `-- Total names: ${list.length}\n\n`
sql += `BEGIN;\n\n`

for (let i = 0; i < list.length; i += CHUNK) {
  const chunk = list.slice(i, i + CHUNK)
  const inList = chunk.map(n => `'${escapeSqlString(n)}'`).join(', ')
  sql += `UPDATE public.doctors\n`
  sql += `SET is_active = false\n`
  sql += `WHERE name IN (${inList});\n\n`
}

sql += `COMMIT;\n`

const outPath = join(__dirname, '../deactivate_medical_officers.sql')
writeFileSync(outPath, sql, 'utf8')
console.log('✅ Generated:', outPath)
