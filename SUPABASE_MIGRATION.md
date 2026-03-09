# Supabase Schema Migration - Medicine Help Enhancement

## Overview
This migration adds real-time chat features, shipment tracking, and review system to the Medicine Help feature.

It also includes a separate migration file for the Pharmacy Finder feature.

## SQL Migration Commands

Run these commands in your Supabase SQL Editor:

### Pharmacy Finder (new)

Run the included SQL file in the repo:

- `pharmacy_finder_migration.sql`

This creates the `pharmacy_finder_requests` table, indexes, and RLS policies so:

- Requesters can create and view their own requests
- Providers (role `provide_service` or `both`) can view and answer requests
- Admins (in `admin_users`) can view and answer requests

### 1. Update medicine_requests status enum
```sql
-- Add new status values if not exists
ALTER TABLE medicine_requests 
DROP CONSTRAINT IF EXISTS medicine_requests_status_check;

ALTER TABLE medicine_requests 
ADD CONSTRAINT medicine_requests_status_check 
CHECK (status IN ('open', 'in_progress', 'shipped', 'received', 'completed', 'cancelled'));
```

### 2. Add shipment tracking columns to medicine_conversations
```sql
ALTER TABLE medicine_conversations 
ADD COLUMN IF NOT EXISTS shipment_status VARCHAR(20) DEFAULT 'none' 
CHECK (shipment_status IN ('none', 'shipped', 'received')),
ADD COLUMN IF NOT EXISTS tracking_number VARCHAR(100),
ADD COLUMN IF NOT EXISTS shipped_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS received_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS completed_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT true;
```

### 3. Enhance medicine_messages table
```sql
ALTER TABLE medicine_messages 
ADD COLUMN IF NOT EXISTS sender_name VARCHAR(100),
ADD COLUMN IF NOT EXISTS image_path VARCHAR(500),
ADD COLUMN IF NOT EXISTS is_read BOOLEAN DEFAULT false;
```

### 4. Create medicine_reviews table
```sql
CREATE TABLE IF NOT EXISTS medicine_reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  conversation_id UUID NOT NULL REFERENCES medicine_conversations(id) ON DELETE CASCADE,
  requester_id UUID NOT NULL REFERENCES auth.users(id),
  helper_id UUID NOT NULL REFERENCES auth.users(id),
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  is_active BOOLEAN DEFAULT true
);

-- Index for faster lookups
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_conversation ON medicine_reviews(conversation_id);
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_requester ON medicine_reviews(requester_id);
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_helper ON medicine_reviews(helper_id);
```

### 5. Update RLS Policies

#### Enable RLS on medicine_reviews
```sql
ALTER TABLE medicine_reviews ENABLE ROW LEVEL SECURITY;
```

#### Reviews policies
```sql
-- Allow requester to create their own review
CREATE POLICY "Allow requester to create review" ON medicine_reviews
  FOR INSERT WITH CHECK (
    requester_id = auth.uid()
  );

-- Allow involved parties to view reviews
CREATE POLICY "Allow involved parties to view reviews" ON medicine_reviews
  FOR SELECT USING (
    requester_id = auth.uid() OR helper_id = auth.uid()
  );
```

#### Update conversation policies for shipment tracking
```sql
-- Allow helper to update shipment status to 'shipped'
CREATE POLICY "Allow helper to mark shipped" ON medicine_conversations
  FOR UPDATE USING (
    helper_id = auth.uid()
  ) WITH CHECK (
    helper_id = auth.uid() AND 
    shipment_status IN ('none', 'shipped')
  );

-- Allow requester to update shipment status to 'received'
-- Note: This needs a separate policy or a more complex check
```

### 6. Enable Real-time for medicine_messages (if not already enabled)
```sql
-- Check if realtime is enabled
SELECT * FROM pg_publication WHERE pubname = 'supabase_realtime';

-- Add table to realtime publication if not present
ALTER PUBLICATION supabase_realtime ADD TABLE medicine_messages;
ALTER PUBLICATION supabase_realtime ADD TABLE medicine_conversations;
```

## Features Implemented

### WhatsApp-like Real-time Chat
- Real-time message updates via Supabase subscriptions
- User avatars with initials
- Sender names displayed
- Read receipts (single/double checkmarks)
- Image sharing in chat
- Auto-scroll to latest message

### Shipment Tracking
- Provider marks medicine as "shipped" with optional tracking number
- Requester marks medicine as "received"
- Admin can view all shipment statuses
- Timestamps for shipped_at and received_at

### Review System
- 5-star rating system
- Optional comment field
- Review displayed in chat after completion
- Admin can view all reviews
- Chat automatically ends when review is submitted

### Chat Termination
- Review submission deactivates the conversation (is_active = false)
- Completed timestamp recorded
- No new messages can be sent after completion

## Admin Dashboard Updates
- New "Tracking & Reviews" tab added
- View all medicine transactions with shipment status
- See ratings and comments from reviews
- Track completed transactions

## Testing Checklist
- [ ] Start conversation between requester and helper
- [ ] Send text messages in real-time
- [ ] Send image in chat
- [ ] Helper marks medicine as shipped with tracking number
- [ ] Requester marks medicine as received
- [ ] Requester submits review with rating and comment
- [ ] Verify chat ends after review submission
- [ ] Admin views shipment tracking in dashboard
- [ ] Admin views reviews in dashboard
