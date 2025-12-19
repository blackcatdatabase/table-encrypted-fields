-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
-- engine: postgres
-- table:  encrypted_fields

-- Contract view for [encrypted_fields]
-- Hides raw ciphertext; exposes hex digest for routing/debug.
CREATE OR REPLACE VIEW vw_encrypted_fields AS
SELECT
  id,
  entity_table,
  entity_pk,
  field_name,
  meta,
  created_at,
  updated_at,
  UPPER(encode(ciphertext,'hex')) AS ciphertext_hex
FROM encrypted_fields;
