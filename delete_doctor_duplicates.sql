-- Delete duplicate doctors (keeping the first one by created_at or id)
-- Using row_number() which works with UUIDs

DELETE FROM public.doctors
WHERE id IN (
  SELECT id
  FROM (
    SELECT id,
           ROW_NUMBER() OVER (PARTITION BY name ORDER BY created_at ASC) as rn
    FROM public.doctors
  ) sub
  WHERE rn > 1
);
