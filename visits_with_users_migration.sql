-- Migration: Create function to get visits with user emails (admin only)
-- Run this in Supabase SQL Editor

-- Create function to get visits with user details
CREATE OR REPLACE FUNCTION public.get_visits_with_users(limit_count INT DEFAULT 100)
RETURNS TABLE (
  id UUID,
  created_at TIMESTAMP WITH TIME ZONE,
  path TEXT,
  user_id UUID,
  user_email TEXT,
  session_id TEXT,
  user_agent TEXT,
  referrer TEXT
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Check if caller is admin
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users au 
    WHERE au.id = auth.uid()
  ) THEN
    RAISE EXCEPTION 'Access denied';
  END IF;

  RETURN QUERY
  SELECT 
    av.id,
    av.created_at,
    av.path,
    av.user_id,
    au.email::TEXT as user_email,
    av.session_id,
    av.user_agent,
    av.referrer
  FROM public.app_visits av
  LEFT JOIN auth.users au ON av.user_id = au.id
  ORDER BY av.created_at DESC
  LIMIT limit_count;
END;
$$;

-- Grant execute to authenticated users (RLS will check admin status inside function)
GRANT EXECUTE ON FUNCTION public.get_visits_with_users TO authenticated;
GRANT EXECUTE ON FUNCTION public.get_visits_with_users TO anon;
