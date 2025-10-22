<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\EncryptedFields\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class EncryptedFieldDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $entityTable,
        public readonly string $entityPk,
        public readonly string $fieldName,
        public readonly string $ciphertext,
        public readonly array $meta,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
