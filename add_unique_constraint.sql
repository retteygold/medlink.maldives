-- Add unique constraint on hospitals.name to enable ON CONFLICT
-- Run this FIRST, then run insert_hospitals_from_csv.sql

ALTER TABLE public.hospitals 
ADD CONSTRAINT hospitals_name_unique 
UNIQUE (name);
