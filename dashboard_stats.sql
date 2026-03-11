-- Dashboard stats: Count hospitals/clinics and doctors
-- Use this query to display counts in the dashboard

SELECT 
    'Hospitals/Clinics' as type,
    COUNT(*) as total,
    COUNT(name_dv) as with_dhivehi_name,
    COUNT(address_dv) as with_dhivehi_address,
    COUNT(*) - COUNT(name_dv) as missing_name,
    COUNT(*) - COUNT(address_dv) as missing_address
FROM public.hospitals

UNION ALL

SELECT 
    'Doctors' as type,
    COUNT(*) as total,
    COUNT(name_dv) as with_dhivehi_name,
    COUNT(specialty_dv) as with_dhivehi_specialty,
    COUNT(*) - COUNT(name_dv) as missing_name,
    COUNT(*) - COUNT(specialty_dv) as missing_specialty
FROM public.doctors;
