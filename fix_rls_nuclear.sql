-- NUCLEAR OPTION: Drop all UPDATE policies and create one simple working policy
-- Run this in Supabase SQL Editor

-- Step 1: Drop ALL existing UPDATE policies on ride_requests
DROP POLICY IF EXISTS "ride_requests_update_match" ON public.ride_requests;
DROP POLICY IF EXISTS "ride_requests_update_own" ON public.ride_requests;

-- Step 2: Create ONE simple policy that allows any authenticated user to update open requests to matched
-- This is temporary for testing - we'll add driver profile check back once this works
CREATE POLICY "ride_requests_update_any"
ON public.ride_requests
FOR UPDATE
TO authenticated
USING (status = 'open')
WITH CHECK (status IN ('open', 'matched'));

-- Verify
SELECT policyname, qual, with_check 
FROM pg_policies 
WHERE tablename = 'ride_requests' AND cmd = 'UPDATE';
