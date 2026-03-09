-- Fix missing columns for medicine_messages
ALTER TABLE medicine_messages 
ADD COLUMN IF NOT EXISTS sender_name VARCHAR(100),
ADD COLUMN IF NOT EXISTS image_path VARCHAR(500),
ADD COLUMN IF NOT EXISTS is_read BOOLEAN DEFAULT false;

-- Verify columns were added
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'medicine_messages' 
ORDER BY ordinal_position;
