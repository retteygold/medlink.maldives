-- Adds Dhivehi display name columns for hospitals and doctors
-- Run this in Supabase SQL editor

alter table public.hospitals
  add column if not exists name_dv text,
  add column if not exists address_dv text;

alter table public.doctors
  add column if not exists name_dv text,
  add column if not exists hospital_name_dv text,
  add column if not exists specialty_dv text;
