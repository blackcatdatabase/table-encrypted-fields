-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  encrypted_fields

CREATE INDEX IF NOT EXISTS idx_enc_entity ON encrypted_fields (entity_table, entity_pk);

CREATE INDEX IF NOT EXISTS idx_encrypted_fields_field ON encrypted_fields (field_name);

CREATE INDEX IF NOT EXISTS gin_encrypted_fields_meta ON encrypted_fields USING GIN (meta jsonb_path_ops);
