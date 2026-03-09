-- Migration: Create app_visits table for visitor analytics
-- Run this in Supabase SQL Editor

-- Create visits table
CREATE TABLE IF NOT EXISTS public.app_visits (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  path TEXT NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  session_id TEXT,
  user_agent TEXT,
  referrer TEXT
);

-- Enable RLS
ALTER TABLE public.app_visits ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can insert (logged in or anon)
CREATE POLICY "Allow anyone to log visits" ON public.app_visits
  FOR INSERT WITH CHECK (true);

-- Policy: Only admins can view visits
CREATE POLICY "Only admins can view visits" ON public.app_visits
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.admin_users au
      WHERE au.id = auth.uid()
    )
  );

-- Index for performance
CREATE INDEX IF NOT EXISTS idx_app_visits_created_at ON public.app_visits(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_app_visits_user_id ON public.app_visits(user_id);
CREATE INDEX IF NOT EXISTS idx_app_visits_path ON public.app_visits(path);

-- Optional: Enable realtime for live analytics
ALTER PUBLICATION supabase_realtime ADD TABLE public.app_visits;
