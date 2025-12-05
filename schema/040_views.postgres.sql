-- Auto-generated from schema-views-postgres.yaml (map@sha1:EDC13878AE5F346E7EAD2CF0A484FEB7E68F6CDD)
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
