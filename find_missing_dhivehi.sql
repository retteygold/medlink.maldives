-- DIAGNOSTIC: Find all hospitals and doctors with NULL Dhivehi names
-- Run this in Supabase SQL Editor to identify missing translations

-- HOSPITALS with NULL name_dv
SELECT 
    'Hospital' as type,
    id,
    name as english_name,
    name_dv,
    address as english_address,
    address_dv
FROM public.hospitals
WHERE name_dv IS NULL
ORDER BY name;

-- DOCTORS with NULL name_dv
SELECT 
    'Doctor' as type,
    id,
    name as english_name,
    name_dv,
    specialty as english_specialty,
    specialty_dv
FROM public.doctors
WHERE name_dv IS NULL
ORDER BY name;

-- Count summary
SELECT 
    (SELECT COUNT(*) FROM public.hospitals WHERE name_dv IS NULL) as hospitals_missing,
    (SELECT COUNT(*) FROM public.hospitals) as hospitals_total,
    (SELECT COUNT(*) FROM public.doctors WHERE name_dv IS NULL) as doctors_missing,
    (SELECT COUNT(*) FROM public.doctors) as doctors_total;
