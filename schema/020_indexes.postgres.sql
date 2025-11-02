-- Auto-generated from schema-map-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  encrypted_fields
CREATE INDEX IF NOT EXISTS idx_enc_entity ON encrypted_fields (entity_table, entity_pk);

CREATE INDEX IF NOT EXISTS idx_encrypted_fields_field ON encrypted_fields (field_name);
