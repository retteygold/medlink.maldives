-- Add unique constraint on doctors.name to enable ON CONFLICT
-- Run this FIRST, then run insert_doctors_from_csv.sql

ALTER TABLE public.doctors 
ADD CONSTRAINT doctors_name_unique 
UNIQUE (name);
