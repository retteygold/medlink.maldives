-- Medicine Help Enhancement - Supabase Migration
-- Run these commands one by one in the Supabase SQL Editor

-- 1. Update medicine_requests status enum
ALTER TABLE medicine_requests 
DROP CONSTRAINT IF EXISTS medicine_requests_status_check;

ALTER TABLE medicine_requests 
ADD CONSTRAINT medicine_requests_status_check 
CHECK (status IN ('open', 'in_progress', 'shipped', 'received', 'completed', 'cancelled'));

-- 2. Add shipment tracking columns to medicine_conversations
ALTER TABLE medicine_conversations 
ADD COLUMN IF NOT EXISTS shipment_status VARCHAR(20) DEFAULT 'none' 
CHECK (shipment_status IN ('none', 'shipped', 'received')),
ADD COLUMN IF NOT EXISTS tracking_number VARCHAR(100),
ADD COLUMN IF NOT EXISTS shipped_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS received_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS completed_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT true;

-- 3. Enhance medicine_messages table
ALTER TABLE medicine_messages 
ADD COLUMN IF NOT EXISTS sender_name VARCHAR(100),
ADD COLUMN IF NOT EXISTS image_path VARCHAR(500),
ADD COLUMN IF NOT EXISTS is_read BOOLEAN DEFAULT false;

-- 4. Create medicine_reviews table
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

-- 5. Create indexes for faster lookups
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_conversation ON medicine_reviews(conversation_id);
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_requester ON medicine_reviews(requester_id);
CREATE INDEX IF NOT EXISTS idx_medicine_reviews_helper ON medicine_reviews(helper_id);

-- 6. Enable RLS on medicine_reviews
ALTER TABLE medicine_reviews ENABLE ROW LEVEL SECURITY;

-- 7. Reviews policies - allow requester to create their own review
CREATE POLICY "Allow requester to create review" ON medicine_reviews
  FOR INSERT WITH CHECK (
    requester_id = auth.uid()
  );

-- 8. Allow involved parties to view reviews
CREATE POLICY "Allow involved parties to view reviews" ON medicine_reviews
  FOR SELECT USING (
    requester_id = auth.uid() OR helper_id = auth.uid()
  );

-- 9. Enable realtime for tables (if not already enabled)
-- Note: Run these separately if needed
-- ALTER PUBLICATION supabase_realtime ADD TABLE medicine_messages;
-- ALTER PUBLICATION supabase_realtime ADD TABLE medicine_conversations;
