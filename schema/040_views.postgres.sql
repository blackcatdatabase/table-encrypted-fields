-- Auto-generated from schema-views-postgres.yaml (map@sha1:3C365C10BD489376A27944AE10F143E1BE4D3BCF)
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
