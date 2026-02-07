#!/bin/bash

VAULT_DIR=~/secure_vault

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: $VAULT_DIR does not exist. Exiting."
    exit 1
fi

# Function to update permissions
update_perm() {
    file="$1"
    default="$2"
    echo
    echo "Current permissions for $file:"
    ls -l "$VAULT_DIR/$file"

    read -p "Update permissions for $file? (y/n, Enter = default $default): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        read -p "Enter new permission: " perm
        [ -z "$perm" ] && perm="$default"
        chmod "$perm" "$VAULT_DIR/$file"
        echo "Updated $file to $perm"
    elif [ -z "$choice" ]; then
        chmod "$default" "$VAULT_DIR/$file"
        echo "Applied default $default to $file"
    else
        echo "$file permissions unchanged."
    fi
}

# Files and their default permissions
update_perm "keys.txt" 600 
update_perm "secrets.txt" 640
update_perm "logs.txt" 644

echo
echo "Final permissions in $VAULT_DIR:"
ls -l "$VAULT_DIR"
