-- Diagnostic SQL to find name mismatches between CSV and actual database
-- Run this in Supabase SQL Editor to see which names match and which don't

-- 1. Check which doctor names from our list exist in the database
-- This will show doctors that MATCH
SELECT 
  d.name as db_name,
  'MATCHED' as status,
  d.name_dv,
  d.specialty_dv
FROM public.doctors d
WHERE d.name IN (
  'Dr. Adam Khaleel Yoosuf',
  'Dr. Mohamed Sham',
  'Dr. Deepak Kumar',
  'Dr. Sadhima Rasheed',
  'Dr. Ali shafeeq',
  'Dr. Praveen Jeya',
  'Dr. Mariyam Nashwa Naseem',
  'Dr. Mohamed Shifan',
  'Dr. Elena Bykova',
  'Dr. Aishath Ibna Adnan'
)
ORDER BY d.name;

-- 2. Show doctors from our list that DON'T match (possible spelling differences)
-- Run this as a separate query
WITH expected_names AS (
  SELECT unnest(ARRAY[
    'Dr. Adam Khaleel Yoosuf',
    'Dr. Mohamed Sham',
    'Dr. Deepak Kumar',
    'Dr. Sadhima Rasheed',
    'Dr. Ali shafeeq',
    'Dr. Praveen Jeya',
    'Dr. Mariyam Nashwa Naseem',
    'Dr. Mohamed Shifan',
    'Dr. Elena Bykova',
    'Dr. Aishath Ibna Adnan',
    'Dr. Mamatha Chenchugalla',
    'Dr. Samahath',
    'Dr. Bharat Mani Banjade',
    'Dr. Mohamed Razzan Rameez',
    'Dr. Zubair Mohamed Didi',
    'Dr. Santosh Kumar Kalla',
    'Dr. Soodh Antony',
    'Dr. Zeena Mohamed Fuad',
    'Dr. Mohamed Shaneez Najmy',
    'Dr. Chandra Prasad Paneru'
  ]) AS expected_name
)
SELECT 
  e.expected_name,
  'NOT FOUND in DB' as status,
  (SELECT string_agg(d2.name, ' | ') 
   FROM public.doctors d2 
   WHERE d2.name ILIKE '%' || split_part(e.expected_name, ' ', 2) || '%') AS possible_matches
FROM expected_names e
LEFT JOIN public.doctors d ON d.name = e.expected_name
WHERE d.name IS NULL;

-- 3. Check actual doctor names in your database (top 50)
SELECT name, specialty, name_dv, specialty_dv
FROM public.doctors
ORDER BY name
LIMIT 50;

-- 4. Check hospital names that match our CSV
SELECT 
  h.name as db_name,
  'MATCHED' as status,
  h.name_dv,
  h.address_dv
FROM public.hospitals h
WHERE h.name IN (
  'Atoll Clinic',
  'Valley Dental',
  'Mercure Maldives Kooddoo Clinic',
  'Joali Being Clinic',
  'Novalux Diagnostics',
  'Maalifushi by Como',
  'The Clinic At Sirru Fen Fushi',
  'Leykokaa Medical & Rehab',
  'Maldives Diagnostic Centre',
  'Faruvaa Clinic'
);

-- 5. Show all hospital names in your database to compare
SELECT name, category, name_dv, address_dv
FROM public.hospitals
ORDER BY name
LIMIT 100;
