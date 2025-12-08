# encrypted_fields

Per-field encryption store for arbitrary entities.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| ciphertext | BYTEA | NO |  | Encrypted payload. |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| entity_pk | VARCHAR(64) | NO |  | Referenced entity primary key (string). |
| entity_table | VARCHAR(64) | NO |  | Referenced table name. |
| field_name | VARCHAR(64) | NO |  | Encrypted field name. |
| id | BIGINT | NO |  | Surrogate primary key. |
| meta | JSONB | NO |  | Encryption metadata (JSON). |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |

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
| vw_encrypted_fields | mysql | algorithm=MERGE, security=INVOKER | [packages\encrypted-fields\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/encrypted-fields/schema/040_views.mysql.sql) |
| vw_encrypted_fields_without_binding | mysql | algorithm=MERGE, security=INVOKER | [packages\encrypted-fields\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/encrypted-fields/schema/040_views_joins.mysql.sql) |
| vw_encrypted_fields | postgres |  | [packages\encrypted-fields\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/encrypted-fields/schema/040_views.postgres.sql) |
| vw_encrypted_fields_without_binding | postgres |  | [packages\encrypted-fields\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/encrypted-fields/schema/040_views_joins.postgres.sql) |
