#!/bin/bash
set -euo pipefail

echo "🔧 Updating package index..."
apt-get update


echo "--------------------------------------------------------------------"
echo "📦 Installing Python packages..."

apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python-is-python3 \
    openssh-server \
    sshpass \
    git \
    curl


echo "--------------------------------------------------------------------"
echo "🐍 Installing Ansible (standalone)..."
apt-get install -y --no-install-recommends ansible



apt-get purge -y build-essential libssl-dev libffi-dev
apt-get autoremove -y

echo "✅ Ansible installation complete."
