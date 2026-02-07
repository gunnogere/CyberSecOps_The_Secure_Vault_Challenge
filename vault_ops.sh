#!/bin/bash

VAULT_DIR=~/secure_vault
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"

if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: $VAULT_DIR does not exist. Exiting."
    exit 1
fi

while true; do
    echo
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    read -p "Choose [1-5]: " opt

    case $opt in
        1)
            read -p "Enter new secret: " s
            echo "$s" >> "$SECRETS"
            echo "Secret added."
            ;;
        2)
            read -p "Text to replace: " old
            read -p "New text: " new
            if grep -qF "$old" "$SECRETS"; then
                sed -i "s/$old/$new/g" "$SECRETS"
                echo "Secret updated."
            else
                echo "No match found."
            fi
            ;;
        3)
            read -p "Log entry: " log
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] $log" >> "$LOGS"
            echo "Log added."
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done
