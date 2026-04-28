#!/usr/bin/env bash

echo "=== Initializing Pipeline Environment ==="

# Check if scripts folder exists
if [ ! -d "./scripts" ]; then
    echo "[-] Error: 'scripts/' directory not found."
    echo "[-] Please run this script from the root of the repository."
    exit 1
fi

# Check if requirements.txt exists
if [ ! -f "requirements.txt" ]; then
    echo "[-] Error: 'requirements.txt' not found."
    exit 1
fi

# 1. Get the absolute path to the scripts directory
SCRIPTS_DIR=$(realpath ./scripts)

# 2. Make every Python/Bash file inside the scripts folder executable
echo "[*] Making scripts executable..."
chmod +x "$SCRIPTS_DIR"/*

# 3. Create an isolated virtual environment
ENV_NAME="thesis_env"
if [ ! -d "$ENV_NAME" ]; then
    echo "[*] Creating isolated Python environment: $ENV_NAME..."
    python3 -m venv $ENV_NAME
else
    echo "[*] Environment '$ENV_NAME' already exists. Updating..."
fi

# 4. Activate and install dependencies
echo "[*] Installing dependencies..."
source $ENV_NAME/bin/activate
pip install --upgrade pip --quiet
pip install -r requirements.txt --quiet

echo "-------------------------------------------------------"
echo "[+] SETUP COMPLETE!"
echo "[+] Step 1: Activate the environment before running anything:"
echo "    source $ENV_NAME/bin/activate"
echo ""
echo "[+] Step 2: Add scripts to your PATH for this session:"
echo "    export PATH=\"$SCRIPTS_DIR:\$PATH\""
echo "-------------------------------------------------------"
