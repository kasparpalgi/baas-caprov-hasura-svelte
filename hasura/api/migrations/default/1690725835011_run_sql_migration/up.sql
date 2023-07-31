DO $$
BEGIN
  IF NOT EXISTS(SELECT id
            FROM storage.buckets
            WHERE id = 'default')
  THEN
    INSERT INTO storage.buckets (id)
      VALUES ('default');
  END IF;
END $$;

COMMIT;
