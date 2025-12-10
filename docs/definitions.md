# encrypted_fields

Per-field encryption store for arbitrary entities.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| field_name | VARCHAR(64) | NO |  | Encrypted field name. |
| id | BIGINT | NO |  | Surrogate primary key. |
| ciphertext | mysql: LONGBLOB / postgres: BYTEA | NO |  | Encrypted payload. |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| entity_table | VARCHAR(64) | NO |  | Referenced table name. |
| meta | mysql: JSON / postgres: JSONB | NO |  | Encryption metadata (JSON). |
| updated_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |
| entity_pk | VARCHAR(64) | NO |  | Referenced entity primary key (string). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_enc_entity_field | entity_table, entity_pk, field_name |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_enc_entity | entity_table,entity_pk | INDEX idx_enc_entity (entity_table, entity_pk) |
| idx_encrypted_fields_field | field_name | CREATE INDEX idx_encrypted_fields_field ON encrypted_fields (field_name) |
| ux_enc_entity_field | entity_table,entity_pk,field_name | UNIQUE KEY ux_enc_entity_field (entity_table, entity_pk, field_name) |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_enc_entity_field | entity_table, entity_pk, field_name |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| gin_encrypted_fields_meta | metajsonb_path_ops | CREATE INDEX IF NOT EXISTS gin_encrypted_fields_meta ON encrypted_fields USING GIN (meta jsonb_path_ops) |
| idx_enc_entity | entity_table,entity_pk | CREATE INDEX IF NOT EXISTS idx_enc_entity ON encrypted_fields (entity_table, entity_pk) |
| idx_encrypted_fields_field | field_name | CREATE INDEX IF NOT EXISTS idx_encrypted_fields_field ON encrypted_fields (field_name) |
| ux_enc_entity_field | entity_table,entity_pk,field_name | CONSTRAINT ux_enc_entity_field UNIQUE (entity_table, entity_pk, field_name) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_encrypted_fields | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_encrypted_fields_without_binding | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_encrypted_fields | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_encrypted_fields_without_binding | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
