-- DIAGNOSTIC: Check actual hospital names in database vs CSV names
-- Run this in Supabase SQL Editor to identify name mismatches
-- This will show you what names actually exist in the database

-- List ALL hospital names currently in the database
SELECT id, name, name_dv, address, address_dv
FROM public.hospitals
ORDER BY name;

-- Check for specific names from the CSV that might not match exactly
-- Uncomment and modify these to test specific cases:

-- Check for 'Atoll Clinic' variations
-- SELECT id, name FROM public.hospitals WHERE name ILIKE '%atoll%' OR name ILIKE '%clinic%';

-- Check for 'TreeTop Hospital' variations
-- SELECT id, name FROM public.hospitals WHERE name ILIKE '%tree%' OR name ILIKE '%top%';

-- Check for 'Indira Gandhi' variations
-- SELECT id, name FROM public.hospitals WHERE name ILIKE '%indira%' OR name ILIKE '%gandhi%';

-- Show count of hospitals with NULL name_dv
-- SELECT COUNT(*) as null_name_dv_count FROM public.hospitals WHERE name_dv IS NULL;
