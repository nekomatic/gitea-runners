#!/bin/bash
set -euo pipefail

echo "🔧 Updating package index..."
apt-get update

echo "--------------------------------------------------------------------"
echo "🐍 Installing Ansible (standalone)..."
apt-get install -y --no-install-recommends ansible

echo "--------------------------------------------------------------------"
echo "📦 Installing Python packages..."

#apt-get install -y --no-install-recommends \
#    build-essential \
#    libssl-dev \
#    libffi-dev \
#    binutils

apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python-is-python3


#python3 -m pip install --no-cache-dir --upgrade pip --break-system-packages
#python3 -m pip install --no-cache-dir --break-system-packages \
#    ansible-lint \
#    bitwarden-sdk

apt-get purge -y build-essential libssl-dev libffi-dev
apt-get autoremove -y

echo "✅ Ansible installation complete."
