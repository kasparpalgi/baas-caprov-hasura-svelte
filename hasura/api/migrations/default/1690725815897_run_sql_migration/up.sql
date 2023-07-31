DROP TRIGGER IF EXISTS set_storage_buckets_updated_at ON storage.buckets;
CREATE TRIGGER set_storage_buckets_updated_at
  BEFORE UPDATE ON storage.buckets
  FOR EACH ROW
  EXECUTE FUNCTION storage.set_current_timestamp_updated_at ();

DROP TRIGGER IF EXISTS set_storage_files_updated_at ON storage.files;
CREATE TRIGGER set_storage_files_updated_at
  BEFORE UPDATE ON storage.files
  FOR EACH ROW
  EXECUTE FUNCTION storage.set_current_timestamp_updated_at ();

DROP TRIGGER IF EXISTS check_default_bucket_delete ON storage.buckets;
CREATE TRIGGER check_default_bucket_delete
  BEFORE DELETE ON storage.buckets
  FOR EACH ROW
    EXECUTE PROCEDURE storage.protect_default_bucket_delete ();

DROP TRIGGER IF EXISTS check_default_bucket_update ON storage.buckets;
CREATE TRIGGER check_default_bucket_update
  BEFORE UPDATE ON storage.buckets
  FOR EACH ROW
    EXECUTE PROCEDURE storage.protect_default_bucket_update ();
