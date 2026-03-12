-- ACTUAL DEBUG: Check the real state of RLS and policies

-- 1. Is RLS enabled on ride_requests?
SELECT 'ride_requests RLS enabled:' as check_item, relrowsecurity 
FROM pg_class WHERE relname = 'ride_requests';

-- 2. Is RLS enabled on ride_driver_profiles?
SELECT 'ride_driver_profiles RLS enabled:' as check_item, relrowsecurity 
FROM pg_class WHERE relname = 'ride_driver_profiles';

-- 3. What policies exist on ride_driver_profiles?
SELECT policyname, cmd, qual as using_clause
FROM pg_policies 
WHERE tablename = 'ride_driver_profiles';

-- 4. Does the driver profile row actually exist?
SELECT 'Driver profile found:' as check_item, 
       COUNT(*) as count,
       MAX(status) as status
FROM public.ride_driver_profiles 
WHERE user_id = 'ede0eca7-12db-4483-9cea-a65b4de20c1f';

-- 5. What is the current state of the request?
SELECT 'Request status:' as check_item, status
FROM public.ride_requests 
WHERE id = '1225b63a-96a6-43a4-8064-4e32561f4124';
