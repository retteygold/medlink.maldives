-- Find the last hospital missing Dhivehi name
SELECT name, address 
FROM public.hospitals 
WHERE name_dv IS NULL;
