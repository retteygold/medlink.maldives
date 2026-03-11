-- Generate SQL to add Dhivehi names to all hospitals missing them
-- This creates UPDATE statements for hospitals without name_dv

SELECT 
    'UPDATE public.hospitals SET name_dv = ''' || 
    CASE 
        -- You need to fill in the Dhivehi names here
        -- Format: WHEN name = 'English Name' THEN 'Dhivehi Name'
        ELSE NULL 
    END || 
    ''', address_dv = ''' || 
    CASE 
        -- You need to fill in the Dhivehi addresses here
        ELSE NULL 
    END || 
    ''' WHERE id = ''' || id || ''';'
    AS update_sql,
    name,
    address,
    category,
    location_type
FROM public.hospitals 
WHERE name_dv IS NULL 
  AND is_active = true
ORDER BY name;
