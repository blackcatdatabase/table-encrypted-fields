-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  encrypted_fields
CREATE INDEX idx_enc_entity ON encrypted_fields (entity_table, entity_pk);

CREATE INDEX idx_encrypted_fields_field ON encrypted_fields (field_name);
