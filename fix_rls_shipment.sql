-- Fix RLS policies for medicine_conversations to allow shipment tracking

-- First, drop existing helper update policy if it exists
DROP POLICY IF EXISTS "Allow helper to update conversation" ON medicine_conversations;

-- Create policy that allows helper to update shipment status
CREATE POLICY "Allow helper to update conversation" ON medicine_conversations
  FOR UPDATE USING (
    helper_id = auth.uid() OR requester_id = auth.uid()
  ) WITH CHECK (
    helper_id = auth.uid() OR requester_id = auth.uid()
  );

-- Also ensure the requester can mark as received
DROP POLICY IF EXISTS "Allow requester to mark received" ON medicine_conversations;

CREATE POLICY "Allow requester to mark received" ON medicine_conversations
  FOR UPDATE USING (
    requester_id = auth.uid()
  ) WITH CHECK (
    requester_id = auth.uid()
  );
