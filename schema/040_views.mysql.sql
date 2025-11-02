-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  encrypted_fields
-- Contract view for [encrypted_fields]
-- Hides ciphertext; keeps routing metadata.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_encrypted_fields AS
SELECT
  id,
  entity_table,
  entity_pk,
  field_name,
  meta,
  created_at,
  updated_at,
  CAST(LPAD(HEX(ciphertext), 64, '0') AS CHAR(64)) AS ciphertext_hex
FROM encrypted_fields;
