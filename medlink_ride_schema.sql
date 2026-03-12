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

DO $$
BEGIN
  ALTER TYPE public.ride_driver_status ADD VALUE IF NOT EXISTS 'suspended';
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
  suspended_reason text,
  suspended_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS rejection_reason text;

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS suspended_reason text;

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS suspended_at timestamptz;

ALTER TABLE public.ride_driver_profiles
ADD COLUMN IF NOT EXISTS vehicle_image_path text;

CREATE UNIQUE INDEX IF NOT EXISTS ride_driver_profiles_user_id_key ON public.ride_driver_profiles(user_id);
CREATE INDEX IF NOT EXISTS ride_driver_profiles_vehicle_type_idx ON public.ride_driver_profiles(vehicle_type);
CREATE INDEX IF NOT EXISTS ride_driver_profiles_status_idx ON public.ride_driver_profiles(status);

-- RLS for driver profiles (needed for admin UI + for ride_requests accept policy EXISTS checks)
ALTER TABLE public.ride_driver_profiles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "ride_driver_profiles_select_own" ON public.ride_driver_profiles;
CREATE POLICY "ride_driver_profiles_select_own"
ON public.ride_driver_profiles
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "ride_driver_profiles_select_admin" ON public.ride_driver_profiles;
CREATE POLICY "ride_driver_profiles_select_admin"
ON public.ride_driver_profiles
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_driver_profiles_update_admin" ON public.ride_driver_profiles;
CREATE POLICY "ride_driver_profiles_update_admin"
ON public.ride_driver_profiles
FOR UPDATE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
)
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_driver_profiles_delete_admin" ON public.ride_driver_profiles;
CREATE POLICY "ride_driver_profiles_delete_admin"
ON public.ride_driver_profiles
FOR DELETE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

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
  en_route_at timestamptz,
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
ADD COLUMN IF NOT EXISTS en_route_at timestamptz;

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

-- RLS (required for production Supabase)
ALTER TABLE public.ride_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ride_trips ENABLE ROW LEVEL SECURITY;

-- Ride requests
DROP POLICY IF EXISTS "ride_requests_select_own" ON public.ride_requests;
CREATE POLICY "ride_requests_select_own"
ON public.ride_requests
FOR SELECT
TO authenticated
USING (auth.uid() = rider_user_id);

DROP POLICY IF EXISTS "ride_requests_insert_own" ON public.ride_requests;
CREATE POLICY "ride_requests_insert_own"
ON public.ride_requests
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = rider_user_id);

DROP POLICY IF EXISTS "ride_requests_update_own" ON public.ride_requests;
CREATE POLICY "ride_requests_update_own"
ON public.ride_requests
FOR UPDATE
TO authenticated
USING (auth.uid() = rider_user_id)
WITH CHECK (auth.uid() = rider_user_id);

-- Drivers can view open requests (dashboard listing)
DROP POLICY IF EXISTS "ride_requests_select_open" ON public.ride_requests;
CREATE POLICY "ride_requests_select_open"
ON public.ride_requests
FOR SELECT
TO authenticated
USING (status = 'open');

-- Drivers can mark request as matched when accepting
DROP POLICY IF EXISTS "ride_requests_update_match" ON public.ride_requests;
CREATE POLICY "ride_requests_update_match"
ON public.ride_requests
FOR UPDATE
TO authenticated
USING (
  status = 'open'
  AND EXISTS (
    SELECT 1
    FROM public.ride_driver_profiles p
    WHERE p.user_id = auth.uid()
      AND p.status = 'approved'
  )
)
WITH CHECK (
  status = 'matched'
  AND EXISTS (
    SELECT 1
    FROM public.ride_driver_profiles p
    WHERE p.user_id = auth.uid()
      AND p.status = 'approved'
  )
);

CREATE OR REPLACE FUNCTION public.accept_ride_request(p_request_id uuid)
RETURNS public.ride_trips
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user_id uuid;
  v_req public.ride_requests;
  v_trip public.ride_trips;
BEGIN
  v_user_id := auth.uid();
  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'Not authenticated' USING ERRCODE = '28000';
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM public.ride_driver_profiles p
    WHERE p.user_id = v_user_id
      AND p.status = 'approved'
  ) THEN
    RAISE EXCEPTION 'Driver not approved' USING ERRCODE = '42501';
  END IF;

  SELECT *
  INTO v_req
  FROM public.ride_requests r
  WHERE r.id = p_request_id
  FOR UPDATE;

  IF v_req.id IS NULL THEN
    RAISE EXCEPTION 'Request not found' USING ERRCODE = 'P0002';
  END IF;

  IF v_req.status <> 'open' THEN
    RAISE EXCEPTION 'Request is not available' USING ERRCODE = 'P0001';
  END IF;

  UPDATE public.ride_requests
  SET status = 'matched'
  WHERE id = p_request_id;

  INSERT INTO public.ride_trips (request_id, driver_user_id, status, amount)
  VALUES (p_request_id, v_user_id, 'accepted', COALESCE(v_req.fare, 0))
  RETURNING * INTO v_trip;

  RETURN v_trip;
END;
$$;

GRANT EXECUTE ON FUNCTION public.accept_ride_request(uuid) TO authenticated;

-- Ride trips
-- Rider can read their trip (through request ownership)
DROP POLICY IF EXISTS "ride_trips_select_rider" ON public.ride_trips;
CREATE POLICY "ride_trips_select_rider"
ON public.ride_trips
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.ride_requests r
    WHERE r.id = request_id
      AND r.rider_user_id = auth.uid()
  )
);

-- Driver can read their own trip
DROP POLICY IF EXISTS "ride_trips_select_driver" ON public.ride_trips;
CREATE POLICY "ride_trips_select_driver"
ON public.ride_trips
FOR SELECT
TO authenticated
USING (driver_user_id = auth.uid());

-- Driver can insert trip only for themselves (accept ride)
DROP POLICY IF EXISTS "ride_trips_insert_driver" ON public.ride_trips;
CREATE POLICY "ride_trips_insert_driver"
ON public.ride_trips
FOR INSERT
TO authenticated
WITH CHECK (driver_user_id = auth.uid());

-- Driver can update own trip (status + location)
DROP POLICY IF EXISTS "ride_trips_update_driver" ON public.ride_trips;
CREATE POLICY "ride_trips_update_driver"
ON public.ride_trips
FOR UPDATE
TO authenticated
USING (driver_user_id = auth.uid())
WITH CHECK (driver_user_id = auth.uid());

-- Admin can read all trips + requests
DROP POLICY IF EXISTS "ride_trips_select_admin" ON public.ride_trips;
CREATE POLICY "ride_trips_select_admin"
ON public.ride_trips
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_requests_select_admin" ON public.ride_requests;
CREATE POLICY "ride_requests_select_admin"
ON public.ride_requests
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

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

-- Zones + zone-based fare rules
CREATE TABLE IF NOT EXISTS public.ride_zones (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  description text,
  is_active boolean NOT NULL DEFAULT true,
  sort_order int NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS ride_zones_slug_key ON public.ride_zones(slug);
CREATE INDEX IF NOT EXISTS ride_zones_active_sort_idx ON public.ride_zones(is_active, sort_order, name);

DROP TRIGGER IF EXISTS ride_zones_set_updated_at ON public.ride_zones;
CREATE TRIGGER ride_zones_set_updated_at
BEFORE UPDATE ON public.ride_zones
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TABLE IF NOT EXISTS public.ride_fare_rules (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  origin_zone_id uuid NOT NULL REFERENCES public.ride_zones(id) ON DELETE CASCADE,
  destination_zone_id uuid NOT NULL REFERENCES public.ride_zones(id) ON DELETE CASCADE,
  vehicle_type public.ride_vehicle_type NOT NULL,
  fare numeric NOT NULL DEFAULT 0,
  is_active boolean NOT NULL DEFAULT true,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT ride_fare_rules_zone_pair_not_same CHECK (origin_zone_id <> destination_zone_id)
);

CREATE UNIQUE INDEX IF NOT EXISTS ride_fare_rules_exact_key
ON public.ride_fare_rules(origin_zone_id, destination_zone_id, vehicle_type);
CREATE INDEX IF NOT EXISTS ride_fare_rules_active_lookup_idx
ON public.ride_fare_rules(is_active, vehicle_type, origin_zone_id, destination_zone_id);

DROP TRIGGER IF EXISTS ride_fare_rules_set_updated_at ON public.ride_fare_rules;
CREATE TRIGGER ride_fare_rules_set_updated_at
BEFORE UPDATE ON public.ride_fare_rules
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

ALTER TABLE public.ride_zones ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ride_fare_rules ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "ride_zones_select_active" ON public.ride_zones;
CREATE POLICY "ride_zones_select_active"
ON public.ride_zones
FOR SELECT
TO anon, authenticated
USING (is_active = true);

DROP POLICY IF EXISTS "ride_zones_select_admin" ON public.ride_zones;
CREATE POLICY "ride_zones_select_admin"
ON public.ride_zones
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_zones_insert_admin" ON public.ride_zones;
CREATE POLICY "ride_zones_insert_admin"
ON public.ride_zones
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_zones_update_admin" ON public.ride_zones;
CREATE POLICY "ride_zones_update_admin"
ON public.ride_zones
FOR UPDATE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
)
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_zones_delete_admin" ON public.ride_zones;
CREATE POLICY "ride_zones_delete_admin"
ON public.ride_zones
FOR DELETE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_fare_rules_select_active" ON public.ride_fare_rules;
CREATE POLICY "ride_fare_rules_select_active"
ON public.ride_fare_rules
FOR SELECT
TO anon, authenticated
USING (is_active = true);

DROP POLICY IF EXISTS "ride_fare_rules_select_admin" ON public.ride_fare_rules;
CREATE POLICY "ride_fare_rules_select_admin"
ON public.ride_fare_rules
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_fare_rules_insert_admin" ON public.ride_fare_rules;
CREATE POLICY "ride_fare_rules_insert_admin"
ON public.ride_fare_rules
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_fare_rules_update_admin" ON public.ride_fare_rules;
CREATE POLICY "ride_fare_rules_update_admin"
ON public.ride_fare_rules
FOR UPDATE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
)
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "ride_fare_rules_delete_admin" ON public.ride_fare_rules;
CREATE POLICY "ride_fare_rules_delete_admin"
ON public.ride_fare_rules
FOR DELETE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

-- SOS alerts table
CREATE TABLE IF NOT EXISTS public.sos_alerts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  trip_id uuid REFERENCES public.ride_trips(id) ON DELETE SET NULL,
  location_lat double precision,
  location_lng double precision,
  notes text,
  status text NOT NULL DEFAULT 'active',
  created_at timestamptz NOT NULL DEFAULT now(),
  resolved_at timestamptz
);

CREATE INDEX IF NOT EXISTS sos_alerts_user_idx ON public.sos_alerts(user_id);
CREATE INDEX IF NOT EXISTS sos_alerts_status_idx ON public.sos_alerts(status);
CREATE INDEX IF NOT EXISTS sos_alerts_trip_idx ON public.sos_alerts(trip_id);

ALTER TABLE public.sos_alerts ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "sos_alerts_insert_own" ON public.sos_alerts;
CREATE POLICY "sos_alerts_insert_own"
ON public.sos_alerts
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "sos_alerts_select_own" ON public.sos_alerts;
CREATE POLICY "sos_alerts_select_own"
ON public.sos_alerts
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "sos_alerts_select_admin" ON public.sos_alerts;
CREATE POLICY "sos_alerts_select_admin"
ON public.sos_alerts
FOR SELECT
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);

DROP POLICY IF EXISTS "sos_alerts_update_admin" ON public.sos_alerts;
CREATE POLICY "sos_alerts_update_admin"
ON public.sos_alerts
FOR UPDATE
TO authenticated
USING (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
)
WITH CHECK (
  EXISTS (SELECT 1 FROM public.admin_users au WHERE au.id = auth.uid())
);
