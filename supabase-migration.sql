-- ILLUME Effect Bookings: Supabase migration
-- Run this in Supabase SQL Editor (Dashboard > SQL Editor > New query)

-- Create bookings table
CREATE TABLE IF NOT EXISTS public.bookings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  service TEXT NOT NULL,
  date DATE NOT NULL,
  time TEXT NOT NULL,
  total INTEGER NOT NULL,
  deposit INTEGER NOT NULL,
  balance INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(date, time)
);

-- Index for fast lookups by date (fetching available times)
CREATE INDEX IF NOT EXISTS idx_bookings_date ON public.bookings(date);

-- Enable RLS
ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

-- Policy: Public can SELECT (read available/booked times)
CREATE POLICY "Allow public select on bookings"
  ON public.bookings
  FOR SELECT
  USING (true);

-- Policy: Public can INSERT (create booking) – only required fields
CREATE POLICY "Allow public insert on bookings"
  ON public.bookings
  FOR INSERT
  WITH CHECK (true);

-- No UPDATE or DELETE policies – public cannot modify/delete
