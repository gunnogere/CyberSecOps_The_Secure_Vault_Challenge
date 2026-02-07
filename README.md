# CyberSec Ops: Secure Vault Challenge

This project focuses on building a **secure vault system in Linux** using Bash scripts. The goal is to store sensitive files safely, control file access, and check for security risks.

The project is split into **four steps**, with each step building on the previous one.

## Project Steps

### Step 1: Vault Setup (`vault_setup.sh`)
- Creates a directory called `secure_vault` in the user’s home folder  
- Creates three files inside the directory:
  - `keys.txt` – stores keys
  - `secrets.txt` – stores secret data
  - `logs.txt` – stores log entries
- Adds a welcome message to each file
- Prints a success message and displays file details using `ls -l`

### Step 2: Vault Permissions (`vault_permissions.sh`)
- Checks if `secure_vault` exists
- For each file, the script:
  - Shows current permissions
  - Asks the user if they want to change them
  - Applies safe default permissions if the user presses Enter
- Displays final permissions for all files

### Step 3: Vault Operations (`vault_ops.sh`)
- Runs a menu in a loop until the user exits
- Menu options:
  - Add a new secret
  - Update an existing secret
  - Add a timestamped log entry
  - Access keys (always denied)
  - Exit the program

### Step 4: Vault Monitoring (`vault_monitor.sh`)
- Checks all files in the vault and displays:
  - File name
  - File size
  - Last modified date
  - File permissions
- Warns if any file has unsafe permissions
- Saves results to `vault_report.txt`

## Skills Demonstrated
- Linux file permissions
- Bash scripting
- Secure file handling
- Basic security monitoring

## Author
**Joshua Mulongo**  
j.mulongo@alustudent.com
