/**
 * Split large SQL file into smaller chunks for Supabase
 * Run with: node scripts/split-sql.js
 */

import { readFileSync, writeFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

const sqlPath = join(__dirname, '../insert_doctors_from_csv.sql')
const sqlContent = readFileSync(sqlPath, 'utf8')

// Extract just the INSERT statements (skip BEGIN and COMMENTS)
const lines = sqlContent.split('\n')
const insertStatements = []
let currentStatement = ''

for (const line of lines) {
  const trimmed = line.trim()
  if (!trimmed || trimmed.startsWith('--') || trimmed === 'BEGIN;' || trimmed === 'COMMIT;') continue
  
  currentStatement += line + '\n'
  if (trimmed.endsWith(';')) {
    insertStatements.push(currentStatement.trim())
    currentStatement = ''
  }
}

console.log(`Total INSERT statements: ${insertStatements.length}`)

// Split into chunks of 100 statements
const CHUNK_SIZE = 100
const chunks = []

for (let i = 0; i < insertStatements.length; i += CHUNK_SIZE) {
  chunks.push(insertStatements.slice(i, i + CHUNK_SIZE))
}

console.log(`Number of chunks: ${chunks.length}`)

// Write each chunk to a separate file
chunks.forEach((chunk, index) => {
  const chunkNumber = index + 1
  let chunkSql = `-- Doctors SQL Part ${chunkNumber} of ${chunks.length}\n`
  chunkSql += `-- Run this chunk, then proceed to next\n\n`
  chunkSql += `BEGIN;\n\n`
  chunkSql += chunk.join('\n\n')
  chunkSql += `\n\nCOMMIT;\n`
  
  const outputPath = join(__dirname, `../insert_doctors_part${chunkNumber.toString().padStart(3, '0')}.sql`)
  writeFileSync(outputPath, chunkSql, 'utf8')
  console.log(`✅ Created: insert_doctors_part${chunkNumber.toString().padStart(3, '0')}.sql (${chunk.length} statements)`)
})

console.log(`\n📋 Run each part in order in Supabase SQL Editor`)
console.log(`Start with: insert_doctors_part001.sql`)
