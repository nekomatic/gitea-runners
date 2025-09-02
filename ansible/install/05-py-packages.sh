#!/bin/bash
set -euo pipefail
python3 -m pip install --no-cache-dir --upgrade pip --break-system-packages
python3 -m pip install --no-cache-dir --break-system-packages \
    ansible \
    ansible-lint \
    bitwarden-sdk
