#!/bin/bash

MAIL_FILE="social/mail.txt"
TWITTER_FILE="social/twitter.txt"
DISCORD_FILE="social/discord.txt"

OUTPUT_SQL="socials_data.sql"
> "$OUTPUT_SQL"

process_file() {
    local file=$1
    local social=$2
    if [[ -f "$file" ]]; then
        cut -d ':' -f1,2 "$file" | while IFS=':' read -r username password
        do
            echo "INSERT INTO social_secrets (social, username, password) VALUES ('$social', '$username', '$password');" >> "$OUTPUT_SQL"
        done
    fi
}

process_file "$MAIL_FILE" "email"
process_file "$TWITTER_FILE" "twitter"
process_file "$DISCORD_FILE" "discord"

echo "SQL файл '$OUTPUT_SQL' создан успешно."