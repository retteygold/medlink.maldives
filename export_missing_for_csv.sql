-- Run this in Supabase SQL Editor to export missing hospital names as CSV format
-- Copy the output and fill in the Dhivehi translations

-- For HOSPITALS (missing name_dv)
SELECT 
    name as "Name (English)",
    '' as "Name (Dhivehi)",
    address as "Address (English)",
    '' as "Address (Dhivehi)"
FROM public.hospitals
WHERE name_dv IS NULL
ORDER BY name;

-- For DOCTORS (missing name_dv)
SELECT 
    name as "Name (English)",
    specialty as "Specialty (English)",
    '' as "Name (Dhivehi)",
    '' as "Specialty (Dhivehi)"
FROM public.doctors
WHERE name_dv IS NULL
ORDER BY name;
