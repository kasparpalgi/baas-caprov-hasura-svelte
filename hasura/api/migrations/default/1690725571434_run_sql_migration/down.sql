-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE TABLE IF NOT EXISTS storage.buckets (
--   id text NOT NULL PRIMARY KEY,
--   created_at timestamp with time zone DEFAULT now() NOT NULL,
--   updated_at timestamp with time zone DEFAULT now() NOT NULL,
--   download_expiration int NOT NULL DEFAULT 30, -- 30 seconds
--   min_upload_file_size int NOT NULL DEFAULT 1,
--   max_upload_file_size int NOT NULL DEFAULT 50000000,
--   cache_control text DEFAULT 'max-age=3600',
--   presigned_urls_enabled boolean NOT NULL DEFAULT TRUE
-- );
