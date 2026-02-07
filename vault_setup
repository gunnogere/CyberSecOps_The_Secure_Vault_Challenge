#!/bin/bash

# Directory path
VAULT_DIR=~/secure_vault

# Check if the directory exists
if [ -d "$VAULT_DIR" ]; then
    echo "Directory $VAULT_DIR already exists."
else
    # Create the secure_vault directory
    mkdir -p "$VAULT_DIR"
    if [ $? -eq 0 ]; then
        echo "Directory $VAULT_DIR created successfully."
    else
        echo "Failed to create directory $VAULT_DIR. Exiting."
        exit 1
    fi
fi

# Create files and add welcome messages
echo "Welcome to the Keys Vault" > "$VAULT_DIR/keys.txt"
echo "Welcome to the Secrets Vault" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the Logs Vault" > "$VAULT_DIR/logs.txt"

# Confirm files were created
for file in keys.txt secrets.txt logs.txt; do
    if [ -f "$VAULT_DIR/$file" ]; then
        echo "File $file created successfully."
    else
        echo "Failed to create $file."
    fi
done

# Print final success message
echo "Secure vault setup completed successfully."

# List all files in long format
ls -l "$VAULT_DIR"

## To run this file:
## chmod +x vault_setup.sh
## ./vault_setup.sh
