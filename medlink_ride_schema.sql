-- Medlink Ride MVP schema
-- Run this in Supabase SQL editor

-- Enums
DO $$ BEGIN
  CREATE TYPE public.ride_vehicle_type AS ENUM ('bike', 'car', 'van', 'pickup');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE public.ride_driver_status AS ENUM ('pending', 'approved', 'rejected');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE public.ride_request_status AS ENUM ('open', 'matched', 'cancelled');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE public.ride_trip_status AS ENUM ('accepted', 'arrived', 'started', 'finished', 'cancelled');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

-- Driver profiles
CREATE TABLE IF NOT EXISTS public.ride_driver_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  full_name text NOT NULL,
  phone text NOT NULL,
  vehicle_type public.ride_vehicle_type NOT NULL,
  vehicle_brand text NOT NULL,
  vehicle_color text NOT NULL,
  vehicle_number text NOT NULL,
  license_number text NOT NULL,
  annual_fee numeric NOT NULL DEFAULT 0,
  driver_image_path text,
  license_image_path text,
  vehicle_image_path text,
  status public.ride_driver_status NOT NULL DEFAULT 'pending',
  rejection_reason text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS rejection_reason text;

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS vehicle_image_path text;

CREATE UNIQUE INDEX IF NOT EXISTS ride_driver_profiles_user_id_key ON public.ride_driver_profiles(user_id);
CREATE INDEX IF NOT EXISTS ride_driver_profiles_vehicle_type_idx ON public.ride_driver_profiles(vehicle_type);
CREATE INDEX IF NOT EXISTS ride_driver_profiles_status_idx ON public.ride_driver_profiles(status);

-- Ride requests (rider creates)
CREATE TABLE IF NOT EXISTS public.ride_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_user_id uuid NOT NULL,
  origin_text text NOT NULL,
  origin_lat double precision,
  origin_lng double precision,
  destination_text text NOT NULL,
  destination_lat double precision,
  destination_lng double precision,
  vehicle_type public.ride_vehicle_type NOT NULL,
  fare numeric NOT NULL DEFAULT 0,
  status public.ride_request_status NOT NULL DEFAULT 'open',
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.ride_requests
ADD COLUMN IF NOT EXISTS origin_lat double precision;

ALTER TABLE public.ride_requests
ADD COLUMN IF NOT EXISTS origin_lng double precision;

ALTER TABLE public.ride_requests
ADD COLUMN IF NOT EXISTS destination_lat double precision;

ALTER TABLE public.ride_requests
ADD COLUMN IF NOT EXISTS destination_lng double precision;

CREATE INDEX IF NOT EXISTS ride_requests_status_vehicle_idx ON public.ride_requests(status, vehicle_type);
CREATE INDEX IF NOT EXISTS ride_requests_rider_idx ON public.ride_requests(rider_user_id);

-- Trips (driver accepts a request)
CREATE TABLE IF NOT EXISTS public.ride_trips (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  request_id uuid NOT NULL REFERENCES public.ride_requests(id) ON DELETE CASCADE,
  driver_user_id uuid NOT NULL,
  status public.ride_trip_status NOT NULL DEFAULT 'accepted',
  accepted_at timestamptz NOT NULL DEFAULT now(),
  arrived_at timestamptz,
  started_at timestamptz,
  finished_at timestamptz,
  driver_lat double precision,
  driver_lng double precision,
  driver_updated_at timestamptz,
  delay_reason text,
  delay_reported_at timestamptz,
  cash_paid boolean NOT NULL DEFAULT false,
  amount numeric NOT NULL DEFAULT 0,
  rider_rating int,
  rider_rating_comment text
);

ALTER TABLE public.ride_trips
ADD COLUMN IF NOT EXISTS driver_lat double precision;

ALTER TABLE public.ride_trips
ADD COLUMN IF NOT EXISTS driver_lng double precision;

ALTER TABLE public.ride_trips
ADD COLUMN IF NOT EXISTS driver_updated_at timestamptz;

ALTER TABLE public.ride_trips
ADD COLUMN IF NOT EXISTS delay_reason text;

ALTER TABLE public.ride_trips
ADD COLUMN IF NOT EXISTS delay_reported_at timestamptz;

CREATE UNIQUE INDEX IF NOT EXISTS ride_trips_request_id_key ON public.ride_trips(request_id);
CREATE INDEX IF NOT EXISTS ride_trips_driver_idx ON public.ride_trips(driver_user_id);

-- Simple update trigger for updated_at
CREATE OR REPLACE FUNCTION public.set_updated_at() RETURNS trigger AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS ride_driver_profiles_set_updated_at ON public.ride_driver_profiles;
CREATE TRIGGER ride_driver_profiles_set_updated_at
BEFORE UPDATE ON public.ride_driver_profiles
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
