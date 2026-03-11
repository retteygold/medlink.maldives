/**
 * Generate CSV template for hospitals missing Dhivehi names (Batch 2)
 * Run with: node scripts/generate-missing-dhivehi-csv.js
 */

import { writeFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

// SQL query to find missing Dhivehi names
const sqlQuery = `
SELECT id, name, address, category, location_type
FROM public.hospitals 
WHERE name_dv IS NULL OR name_dv = ''
ORDER BY name;
`

console.log('📋 SQL to find remaining hospitals missing Dhivehi names:')
console.log(sqlQuery)

console.log('\n📝 Run this query in Supabase SQL Editor, then export results to CSV.')
console.log('Fill in name_dv and address_dv columns, then send me the file.')
