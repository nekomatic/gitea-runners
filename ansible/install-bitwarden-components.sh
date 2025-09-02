#!/bin/bash
set -euo pipefail

echo "--------------------------------------------------------------------"
echo "📦 Installing Bitwarden SDK (Python)..."
python3 -m pip install --no-cache-dir bitwarden-sdk --break-system-packages

echo "--------------------------------------------------------------------"
echo "📦 Installing Bitwarden Secrets Ansible collection..."
if command -v ansible-galaxy >/dev/null 2>&1; then
    ansible-galaxy collection install bitwarden.secrets || {
        echo "[ERROR] Failed to install bitwarden.secrets collection"
        exit 1
    }
else
    echo "[ERROR] ansible-galaxy not found. Please install Ansible first."
    exit 1
fi

echo "✅ Bitwarden SDK and Ansible collection installed."
