// Script to generate sample placeholder JPG images with actual filenames
// Run: node scripts/generate-sample-images.js

import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { createCanvas } from 'canvas';
import { writeFileSync, existsSync, mkdirSync } from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load env from project root
config({ path: join(__dirname, '../.env') });
config({ path: join(__dirname, '../.env.local') });

const SUPABASE_URL = process.env.VITE_SUPABASE_URL;
const SUPABASE_KEY = process.env.VITE_SUPABASE_ANON_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Error: VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY must be set');
  process.exit(1);
}

function slugify(name) {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Medical-themed color palette
const COLORS = [
  { bg: '#E0F2F1', text: '#00695C', accent: '#4DB6AC' }, // Teal
  { bg: '#E3F2FD', text: '#01579B', accent: '#64B5F6' }, // Blue
  { bg: '#F3E5F5', text: '#6A1B9A', accent: '#BA68C8' }, // Purple
  { bg: '#E8F5E9', text: '#2E7D32', accent: '#81C784' }, // Green
  { bg: '#FFF3E0', text: '#E65100', accent: '#FFB74D' }, // Orange
  { bg: '#FCE4EC', text: '#C2185B', accent: '#F06292' }, // Pink
  { bg: '#E8EAF6', text: '#303F9F', accent: '#7986CB' }, // Indigo
  { bg: '#F1F8E9', text: '#558B2F', accent: '#AED581' }, // Light Green
];

function generatePlaceholderImage(name, type, outputPath) {
  const width = 400;
  const height = type === 'doctor' ? 400 : 300;
  
  const canvas = createCanvas(width, height);
  const ctx = canvas.getContext('2d');
  
  // Pick color based on name length for consistency
  const colorScheme = COLORS[name.length % COLORS.length];
  
  // Background gradient
  const gradient = ctx.createLinearGradient(0, 0, width, height);
  gradient.addColorStop(0, colorScheme.bg);
  gradient.addColorStop(1, '#FFFFFF');
  ctx.fillStyle = gradient;
  ctx.fillRect(0, 0, width, height);
  
  // Draw border
  ctx.strokeStyle = colorScheme.accent;
  ctx.lineWidth = 8;
  ctx.strokeRect(10, 10, width - 20, height - 20);
  
  // Draw icon background circle
  ctx.beginPath();
  ctx.arc(width / 2, height / 2 - 30, 60, 0, Math.PI * 2);
  ctx.fillStyle = colorScheme.accent + '40'; // 25% opacity
  ctx.fill();
  
  // Draw icon
  ctx.fillStyle = colorScheme.text;
  ctx.font = 'bold 60px Arial';
  ctx.textAlign = 'center';
  ctx.textBaseline = 'middle';
  const icon = type === 'doctor' ? '👤' : '🏥';
  ctx.fillText(icon, width / 2, height / 2 - 30);
  
  // Draw name
  ctx.fillStyle = colorScheme.text;
  ctx.font = 'bold 24px Arial';
  ctx.textAlign = 'center';
  ctx.textBaseline = 'middle';
  
  // Wrap text if too long
  const maxWidth = width - 60;
  const words = name.split(' ');
  let line = '';
  let lines = [];
  
  for (let i = 0; i < words.length; i++) {
    const testLine = line + words[i] + ' ';
    const metrics = ctx.measureText(testLine);
    if (metrics.width > maxWidth && i > 0) {
      lines.push(line.trim());
      line = words[i] + ' ';
    } else {
      line = testLine;
    }
  }
  lines.push(line.trim());
  
  // Draw lines
  const lineHeight = 32;
  const startY = height / 2 + 50;
  lines.forEach((line, index) => {
    ctx.fillText(line, width / 2, startY + (index * lineHeight));
  });
  
  // Draw type label
  ctx.fillStyle = colorScheme.accent;
  ctx.font = '16px Arial';
  ctx.fillText(type.toUpperCase(), width / 2, height - 30);
  
  // Save as JPG
  const buffer = canvas.toBuffer('image/jpeg', { quality: 0.9 });
  writeFileSync(outputPath, buffer);
}

async function generateSampleImages() {
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

  // Ensure directories exist
  const doctorsDir = join(__dirname, '../public/images/doctors');
  const hospitalsDir = join(__dirname, '../public/images/hospitals');
  
  if (!existsSync(doctorsDir)) {
    mkdirSync(doctorsDir, { recursive: true });
  }
  if (!existsSync(hospitalsDir)) {
    mkdirSync(hospitalsDir, { recursive: true });
  }

  console.log(`Generating ${doctors.length} doctor images...`);
  let count = 0;
  for (const doc of doctors) {
    const filename = `${slugify(doc.name)}.jpg`;
    const outputPath = join(doctorsDir, filename);
    generatePlaceholderImage(doc.name, 'doctor', outputPath);
    count++;
    if (count % 50 === 0) {
      console.log(`  Progress: ${count}/${doctors.length} doctors...`);
    }
  }
  console.log(`✅ Created ${count} doctor images in public/images/doctors/\n`);

  console.log(`Generating ${hospitals.length} hospital images...`);
  count = 0;
  for (const hosp of hospitals) {
    const filename = `${slugify(hosp.name)}.jpg`;
    const outputPath = join(hospitalsDir, filename);
    generatePlaceholderImage(hosp.name, 'hospital', outputPath);
    count++;
    if (count % 50 === 0) {
      console.log(`  Progress: ${count}/${hospitals.length} hospitals...`);
    }
  }
  console.log(`✅ Created ${count} hospital images in public/images/hospitals/\n`);

  console.log('═══════════════════════════════════════════════════════════════');
  console.log('                    SAMPLE IMAGES CREATED');
  console.log('═══════════════════════════════════════════════════════════════');
  console.log(`Doctors:   ${doctors.length} images → public/images/doctors/`);
  console.log(`Hospitals: ${hospitals.length} images → public/images/hospitals/`);
  console.log('\nNext steps:');
  console.log('1. Replace the sample images with your actual photos');
  console.log('2. Keep the same filenames (e.g., dr-ahmed-naseem.jpg)');
  console.log('3. Commit and push → Vercel will show the real images');
  console.log('═══════════════════════════════════════════════════════════════');
}

generateSampleImages().catch(console.error);
