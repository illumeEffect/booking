# ILLUME Effect Booking System

## Overview
Luxury booking website for ILLUME Effect (Dallas, TX).

Features:
- Supabase backend for global booking lock
- $10 flat deposit
- Auto pricing per service
- Receipt confirmation screen
- Instagram embed
- SMS booking pre-fill
- Holiday theme switching (Valentine / Easter)
- Weekday & weekend time rules

## Time Rules
Mon–Fri → 4:30 PM only
Saturday → 9:00 AM – 4:30 PM
Sunday → 9:00 AM – 4:30 PM

## Deposit Policy
All paid services require a $10 deposit.
Remaining balance due after service completion.

## Database Table: bookings

Columns:
- id (uuid, primary key)
- service (text)
- date (text)
- time (text)
- total (integer)
- deposit (integer)
- created_at (timestamp)

UNIQUE(date, time)

## Admin Controls (JS Controlled)
- Ability to close an entire month manually
- Ability to reopen month by editing admin array

## Supabase
Environment Variables:
SUPABASE_URL=
SUPABASE_ANON_KEY=

Never expose service_role key.
