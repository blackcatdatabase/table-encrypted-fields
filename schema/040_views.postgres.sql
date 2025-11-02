-- Auto-generated from schema-views-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  encrypted_fields
-- Contract view for [encrypted_fields]
-- Hides ciphertext; keeps routing metadata.
CREATE OR REPLACE VIEW vw_encrypted_fields AS
SELECT
  id,
  entity_table,
  entity_pk,
  field_name,
  meta,
  created_at,
  updated_at,
  UPPER(encode(ciphertext,'hex'))::char(64) AS ciphertext_hex
FROM encrypted_fields;
