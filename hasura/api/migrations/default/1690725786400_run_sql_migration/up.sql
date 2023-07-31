DO $$
BEGIN
  IF NOT EXISTS(SELECT table_name
            FROM information_schema.table_constraints
            WHERE table_schema = 'storage'
              AND table_name = 'files'
              AND constraint_name = 'fk_bucket')
  THEN
    ALTER TABLE storage.files
      ADD CONSTRAINT fk_bucket FOREIGN KEY (bucket_id) REFERENCES storage.buckets (id) ON UPDATE CASCADE ON DELETE CASCADE;
  END IF;
END $$;
