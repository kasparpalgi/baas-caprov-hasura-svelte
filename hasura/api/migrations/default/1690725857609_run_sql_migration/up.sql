CREATE OR REPLACE FUNCTION storage.set_current_timestamp_updated_at ()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $a$
DECLARE
  _new record;
BEGIN
  _new := new;
  _new. "updated_at" = now();
  RETURN _new;
END;
$a$;

CREATE OR REPLACE FUNCTION storage.protect_default_bucket_delete ()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $a$
BEGIN
  IF OLD.ID = 'default' THEN
    RAISE EXCEPTION 'Can not delete default bucket';
  END IF;
  RETURN OLD;
END;
$a$;

CREATE OR REPLACE FUNCTION storage.protect_default_bucket_update ()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $a$
BEGIN
  IF OLD.ID = 'default' AND NEW.ID <> 'default' THEN
    RAISE EXCEPTION 'Can not rename default bucket';
  END IF;
  RETURN NEW;
END;
$a$;
