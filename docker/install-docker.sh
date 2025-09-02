#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Installing Docker CLI and Buildx for native architecture builds..."

# Install required packages
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    xz-utils

# Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up Docker repository for Debian
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list


apt-get update
apt-get install -y --no-install-recommends \
    docker-ce-cli \
    docker-buildx-plugin

# Validate Buildx availability
echo "[INFO] Validating Docker Buildx..."
docker buildx version || echo "[WARN] Buildx not available—check plugin path"

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "[INFO] Docker tooling installed successfully for native builds."
