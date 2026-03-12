-- DEBUG: Check why ride_requests update is failing
-- Run this and screenshot all results

-- 1. Check current policies on ride_requests
SELECT policyname, qual as using_clause, with_check 
FROM pg_policies 
WHERE tablename = 'ride_requests' AND cmd = 'UPDATE';

-- 2. Verify driver profile
SELECT 'Driver profile' as check_type, 
       user_id, status, full_name 
FROM public.ride_driver_profiles 
WHERE user_id = 'ede0eca7-12db-4483-9cea-a65b4de20c1f';

-- 3. Verify request status
SELECT 'Request status' as check_type,
       id, status, rider_user_id
FROM public.ride_requests 
WHERE id = '1225b63a-96a6-43a4-8064-4e32561f4124';

-- 4. Test if the policy conditions are met
SELECT 
  'Policy check' as check_type,
  (SELECT status FROM public.ride_requests WHERE id = '1225b63a-96a6-43a4-8064-4e32561f4124') = 'open' as request_open,
  EXISTS (SELECT 1 FROM public.ride_driver_profiles WHERE user_id = 'ede0eca7-12db-4483-9cea-a65b4de20c1f' AND status = 'approved') as driver_exists;
