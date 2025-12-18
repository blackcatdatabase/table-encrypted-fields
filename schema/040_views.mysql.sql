-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
-- engine: mysql
-- table:  encrypted_fields

-- Contract view for [encrypted_fields]
-- Hides raw ciphertext; exposes hex digest for routing/debug.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_encrypted_fields AS
SELECT
  id,
  entity_table,
  entity_pk,
  field_name,
  meta,
  created_at,
  updated_at,
  CAST(UPPER(SHA2(ciphertext, 256)) AS CHAR(64)) AS ciphertext_hex
FROM encrypted_fields;
