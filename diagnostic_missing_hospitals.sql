-- DIAGNOSTIC: Get exact hospital names that still need Dhivehi updates
-- Run this in Supabase to get the actual database names

SELECT 
    name as "Exact Database Name",
    address
FROM public.hospitals
WHERE name_dv IS NULL
ORDER BY name;
