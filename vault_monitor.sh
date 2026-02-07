#!/bin/bash

VAULT_DIR=/mnt/d/ALU/BSE/T2/CyberSecOps_The_Secure_Vault_Challenge
REPORT="$VAULT_DIR/vault_report.txt"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: $VAULT_DIR does not exist. Exiting."
    exit 1
fi

# Empty or create the report file
> "$REPORT"

# Loop through files in secure_vault
for file in "$VAULT_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(stat -c%s "$file")
        mod_date=$(stat -c%y "$file")
        perms=$(stat -c%A "$file")
        
        echo "File: $filename" | tee -a "$REPORT"
        echo "Size: $size bytes" | tee -a "$REPORT"
        echo "Last modified: $mod_date" | tee -a "$REPORT"
        echo "Permissions: $perms" | tee -a "$REPORT"

        # Check if permissions are more open than 644
        numeric_perm=$(stat -c "%a" "$file")
        if [ "$numeric_perm" -gt 644 ]; then
            echo "⚠️ SECURITY RISK DETECTED" | tee -a "$REPORT"
        fi

        echo "------------------------" | tee -a "$REPORT"
    fi
done

echo "Vault report created at $REPORT"
