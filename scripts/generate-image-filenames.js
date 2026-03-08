// Script to generate image filenames from Supabase doctor/hospital data
// Run: node scripts/generate-image-filenames.js

import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { writeFileSync } from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load env from project root
config({ path: join(__dirname, '../.env') });
config({ path: join(__dirname, '../.env.local') });

const SUPABASE_URL = process.env.VITE_SUPABASE_URL;
const SUPABASE_KEY = process.env.VITE_SUPABASE_ANON_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Error: VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY must be set in .env or .env.local');
  process.exit(1);
}

// Same slugify function used in the app
function slugify(name) {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function generateFilenames() {
  console.log('Fetching data from Supabase...\n');

  // Fetch doctors
  const { data: doctors, error: docError } = await supabase
    .from('doctors')
    .select('id, name')
    .order('name');

  if (docError) {
    console.error('Error fetching doctors:', docError.message);
    return;
  }

  // Fetch hospitals
  const { data: hospitals, error: hospError } = await supabase
    .from('hospitals')
    .select('id, name')
    .order('name');

  if (hospError) {
    console.error('Error fetching hospitals:', hospError.message);
    return;
  }

  // Build output string
  let output = '';
  
  output += '═══════════════════════════════════════════════════════════════\n';
  output += '                   DOCTOR IMAGE FILENAMES\n';
  output += '═══════════════════════════════════════════════════════════════\n';
  output += `Total Doctors: ${doctors.length}\n\n`;
  output += 'Filename                              | Doctor Name\n';
  output += '───────────────────────────────────────────────────────────────\n';
  
  doctors.forEach(doc => {
    const filename = `${slugify(doc.name)}.jpg`;
    output += `${filename.padEnd(37)} | ${doc.name}\n`;
  });

  output += '\n═══════════════════════════════════════════════════════════════\n';
  output += '                 HOSPITAL IMAGE FILENAMES\n';
  output += '═══════════════════════════════════════════════════════════════\n';
  output += `Total Hospitals: ${hospitals.length}\n\n`;
  output += 'Filename                              | Hospital Name\n';
  output += '───────────────────────────────────────────────────────────────\n';
  
  hospitals.forEach(hosp => {
    const filename = `${slugify(hosp.name)}.jpg`;
    output += `${filename.padEnd(37)} | ${hosp.name}\n`;
  });

  output += '\n═══════════════════════════════════════════════════════════════\n';
  output += '                      SUMMARY\n';
  output += '═══════════════════════════════════════════════════════════════\n';
  output += `Doctors:   ${doctors.length} images needed in public/images/doctors/\n`;
  output += `Hospitals: ${hospitals.length} images needed in public/images/hospitals/\n`;
  output += '\nExample files to create:\n';
  output += `  public/images/doctors/${doctors.length > 0 ? slugify(doctors[0].name) : 'example'}.jpg\n`;
  output += `  public/images/hospitals/${hospitals.length > 0 ? slugify(hospitals[0].name) : 'example'}.jpg\n`;
  output += '\n═══════════════════════════════════════════════════════════════\n';

  // Save to file
  const outputPath = join(__dirname, '../image-filenames.txt');
  writeFileSync(outputPath, output, 'utf8');
  
  // Also print to console
  console.log(output);
  console.log(`\n✅ Full list saved to: image-filenames.txt`);
}

generateFilenames();
