#!/bin/bash

ADDRESS_FILE="wallets/address.txt"
KEY_FILE="wallets/key.txt"
SEED_FILE="wallets/seed.txt"

INPUT_FILE="wallets/wallets_list.txt"

ONE_FILE_WALLET=0
if [[ ! -f "$ADDRESS_FILE" || ! -f "$KEY_FILE" || ! -f "$SEED_FILE" ]]; then
    ONE_FILE_WALLET=1
    if [[ ! -f "$INPUT_FILE" ]]; then
      echo "Ошибка! В каталоге должны быть файлы: address.txt, key.txt, seed.txt ИЛИ файл wallets_list.txt."
      exit 1
    fi
fi

OUTPUT_SQL="wallets_data.sql"
> "$OUTPUT_SQL"

process_file() {
    local file=$1
    if [[ -f "$file" ]]; then
        while IFS=':' read -r address private seed password
        do
            private="${private:-NULL}"
            [[ $private != "NULL" ]] && private="'$private'"

            seed="${seed:-NULL}"
            [[ seed != "NULL" ]] && seed="'$seed'"

            password="${password:-NULL}"
            [[ $password != "NULL" ]] && password="'$password'"

            comments="${comments:-NULL}"
            [[ $comments != "NULL" ]] && comments="'$comments'"

            echo "INSERT INTO wallet_secrets (wallet_address, private, seed, password, comments) VALUES ('$address', $private, $seed, $password, $comments);" >> "$OUTPUT_SQL"
        done < "$file"
    else
        echo "Ошибка! Файл $file не найден."
        exit 1
    fi
}

if [[ "$ONE_FILE_WALLET" -eq 1 ]]; then
    process_file "$INPUT_FILE"
else
    paste -d '|' "$ADDRESS_FILE" "$KEY_FILE" "$SEED_FILE" | while IFS='|' read -r address private seed
    do
        echo "INSERT INTO wallet_secrets (wallet_address, private, seed) VALUES ('$address', '$private', '$seed');" >> "$OUTPUT_SQL"
    done
fi

#rm -f "$INPUT_FILE"

echo "SQL файл '$OUTPUT_SQL' создан успешно."
