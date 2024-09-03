#!/bin/bash

ADDRESS_FILE="wallets/address.txt"
KEY_FILE="wallets/key.txt"
SEED_FILE="wallets/seed.txt"

OUTPUT_SQL="wallets_data.sql"

if [[ ! -f "$ADDRESS_FILE" || ! -f "$KEY_FILE" || ! -f "$SEED_FILE" ]]; then
    echo "Ошибка! В каталоге должны быть файлы: address.txt, key.txt, seed.txt."
    exit 1
fi

> "$OUTPUT_SQL"
paste -d '|' "$ADDRESS_FILE" "$KEY_FILE" "$SEED_FILE" | while IFS='|' read -r address private seed
do
    echo "INSERT INTO wallet_secrets (wallet_address, private, seed) VALUES ('$address', '$private', '$seed');" >> "$OUTPUT_SQL"
done

echo "SQL файл '$OUTPUT_SQL' создан успешно."

