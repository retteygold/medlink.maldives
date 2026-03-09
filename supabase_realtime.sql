-- Enable realtime for medicine chat tables
ALTER PUBLICATION supabase_realtime ADD TABLE medicine_messages;
ALTER PUBLICATION supabase_realtime ADD TABLE medicine_conversations;
