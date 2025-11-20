-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  encrypted_fields_without_binding
-- Encrypted fields without explicit encryption_binding (for governance)
CREATE OR REPLACE VIEW vw_encrypted_fields_without_binding AS
SELECT
  e.id,
  e.entity_table,
  e.entity_pk,
  e.field_name,
  e.created_at,
  e.updated_at
FROM encrypted_fields e
LEFT JOIN encryption_bindings b
  ON b.entity_table = e.entity_table
 AND b.entity_pk    = e.entity_pk
 AND (b.field_name  = e.field_name OR b.field_name IS NULL)
WHERE b.id IS NULL
ORDER BY e.created_at DESC;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
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
  ciphertext,
  UPPER(encode(ciphertext,'hex')) AS ciphertext_hex
FROM encrypted_fields;

