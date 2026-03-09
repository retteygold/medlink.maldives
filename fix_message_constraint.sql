-- Drop the message check constraint and recreate it to allow null
ALTER TABLE medicine_messages 
DROP CONSTRAINT IF EXISTS medicine_messages_message_check;

-- Add new constraint that allows null or non-empty messages
ALTER TABLE medicine_messages 
ADD CONSTRAINT medicine_messages_message_check 
CHECK (message IS NULL OR length(trim(message)) > 0);
