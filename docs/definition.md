# Definition – encrypted_fields

Per-field encryption store for arbitrary entities.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| entity_table | VARCHAR(64) | NO | — | Referenced table name. |  |
| entity_pk | VARCHAR(64) | NO | — | Referenced entity primary key (string). |  |
| field_name | VARCHAR(64) | NO | — | Encrypted field name. |  |
| ciphertext | LONGBLOB | NO | — | Encrypted payload. | PII: encrypted |
| meta | JSON | NO | — | Encryption metadata (JSON). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
