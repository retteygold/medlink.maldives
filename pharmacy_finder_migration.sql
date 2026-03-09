-- Pharmacy Finder - Supabase Migration
-- Run these commands in the Supabase SQL Editor

-- 1) Table
CREATE TABLE IF NOT EXISTS pharmacy_finder_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),

  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,

  image_path TEXT NOT NULL,
  notes TEXT,

  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'answered', 'closed')),

  -- Answer fields
  pharmacy_name TEXT,
  pharmacy_phone TEXT,
  pharmacy_location TEXT,
  availability TEXT CHECK (availability IN ('in_stock', 'out_of_stock', 'unknown')),

  answered_by UUID REFERENCES auth.users(id),
  answered_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX IF NOT EXISTS idx_pharmacy_finder_requests_user_id ON pharmacy_finder_requests(user_id);
CREATE INDEX IF NOT EXISTS idx_pharmacy_finder_requests_status ON pharmacy_finder_requests(status);
CREATE INDEX IF NOT EXISTS idx_pharmacy_finder_requests_created_at ON pharmacy_finder_requests(created_at);

-- 2) updated_at trigger
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'trg_pharmacy_finder_requests_updated_at'
  ) THEN
    CREATE TRIGGER trg_pharmacy_finder_requests_updated_at
    BEFORE UPDATE ON pharmacy_finder_requests
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();
  END IF;
END $$;

-- 3) RLS
ALTER TABLE pharmacy_finder_requests ENABLE ROW LEVEL SECURITY;

-- Helper function: check if current user is admin
CREATE OR REPLACE FUNCTION is_admin_user()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM admin_users au
    WHERE au.user_id = auth.uid() OR au.id = auth.uid()
  );
$$ LANGUAGE sql STABLE;

-- Requester can create
DROP POLICY IF EXISTS "pharmacy_finder_requester_insert" ON pharmacy_finder_requests;
CREATE POLICY "pharmacy_finder_requester_insert" ON pharmacy_finder_requests
  FOR INSERT
  WITH CHECK (user_id = auth.uid());

-- Requester can view their requests
DROP POLICY IF EXISTS "pharmacy_finder_requester_select" ON pharmacy_finder_requests;
CREATE POLICY "pharmacy_finder_requester_select" ON pharmacy_finder_requests
  FOR SELECT
  USING (user_id = auth.uid());

-- Providers (and both) + admins can view all
DROP POLICY IF EXISTS "pharmacy_finder_provider_admin_select" ON pharmacy_finder_requests;
CREATE POLICY "pharmacy_finder_provider_admin_select" ON pharmacy_finder_requests
  FOR SELECT
  USING (
    is_admin_user()
    OR (auth.jwt() -> 'user_metadata' ->> 'user_role') IN ('provide_service', 'both')
  );

-- Providers/admin can answer/update
DROP POLICY IF EXISTS "pharmacy_finder_provider_admin_update" ON pharmacy_finder_requests;
CREATE POLICY "pharmacy_finder_provider_admin_update" ON pharmacy_finder_requests
  FOR UPDATE
  USING (
    is_admin_user()
    OR (auth.jwt() -> 'user_metadata' ->> 'user_role') IN ('provide_service', 'both')
  )
  WITH CHECK (
    is_admin_user()
    OR (auth.jwt() -> 'user_metadata' ->> 'user_role') IN ('provide_service', 'both')
  );
