-- Drop NOT NULL constraint on message column to allow image-only messages
ALTER TABLE medicine_messages 
ALTER COLUMN message DROP NOT NULL;

-- Verify the change
SELECT column_name, is_nullable, data_type 
FROM information_schema.columns 
WHERE table_name = 'medicine_messages' AND column_name = 'message';
