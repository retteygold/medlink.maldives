-- Check the ACTUAL current status of the request
SELECT id, status, created_at, updated_at
FROM public.ride_requests 
WHERE id = '1225b63a-96a6-43a4-8064-4e32561f4124';

-- Also check if there's a trip already created for this request
SELECT t.id, t.status, t.driver_user_id, t.request_id
FROM public.ride_trips t
WHERE t.request_id = '1225b63a-96a6-43a4-8064-4e32561f4124';
