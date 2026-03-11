/**
 * Combine small SQL chunks into larger batches (500 statements each)
 * Run with: node scripts/combine-sql.js
 */

import { readFileSync, writeFileSync, readdirSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

const baseDir = join(__dirname, '..')

// Find all part files
const files = readdirSync(baseDir)
  .filter(f => f.startsWith('insert_doctors_part') && f.endsWith('.sql'))
  .sort()

console.log(`Found ${files.length} part files`)

// Read all INSERT statements
let allStatements = []

for (const file of files) {
  const content = readFileSync(join(baseDir, file), 'utf8')
  const lines = content.split('\n')
  
  let currentStatement = ''
  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('--') || trimmed === 'BEGIN;' || trimmed === 'COMMIT;') continue
    
    currentStatement += line + '\n'
    if (trimmed.endsWith(';')) {
      allStatements.push(currentStatement.trim())
      currentStatement = ''
    }
  }
}

console.log(`Total INSERT statements: ${allStatements.length}`)

// Create larger batches (500 statements each)
const BATCH_SIZE = 500
const batches = []

for (let i = 0; i < allStatements.length; i += BATCH_SIZE) {
  batches.push(allStatements.slice(i, i + BATCH_SIZE))
}

console.log(`Number of batches: ${batches.length}`)

// Write each batch
batches.forEach((batch, index) => {
  const batchNumber = index + 1
  let batchSql = `-- Doctors SQL Batch ${batchNumber} of ${batches.length}\n`
  batchSql += `-- Contains ${batch.length} doctors\n\n`
  batchSql += `BEGIN;\n\n`
  batchSql += batch.join('\n\n')
  batchSql += `\n\nCOMMIT;\n`
  
  const outputPath = join(baseDir, `doctors_batch_${batchNumber.toString().padStart(2, '0')}.sql`)
  writeFileSync(outputPath, batchSql, 'utf8')
  console.log(`✅ Created: doctors_batch_${batchNumber.toString().padStart(2, '0')}.sql (${batch.length} statements)`)
})

console.log(`\n📋 Run each batch in order:`)
console.log(`1. First delete duplicates and add unique constraint`)
console.log(`2. Then run: doctors_batch_01.sql, doctors_batch_02.sql, etc.`)
