#!/bin/bash
set -euo pipefail
if command -v ansible-galaxy >/dev/null 2>&1; then
    ansible-galaxy collection install bitwarden.secrets || exit 1
else
    echo "[ERROR] ansible-galaxy not found."
    exit 1
fi
