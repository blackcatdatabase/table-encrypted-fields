<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – encrypted_fields

Per-field encryption store for arbitrary entities.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| entity_table | VARCHAR(64) | NO | — | Referenced table name. |  |
| entity_pk | VARCHAR(64) | NO | — | Referenced entity primary key (string). |  |
| field_name | VARCHAR(64) | NO | — | Encrypted field name. |  |
| ciphertext | BYTEA | NO | — | Encrypted payload. | PII: encrypted |
| meta | JSONB | NO | — | Encryption metadata (JSON). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |