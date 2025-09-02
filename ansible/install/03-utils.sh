#!/bin/bash
set -euo pipefail
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    sshpass \
    wget \
    openssh-client \
    gnupg \
    unzip \
    jq \
    iproute2 \
    netcat-openbsd \
    openssl \
    gnutls-bin \
    nmap \
    xxd \
    file \
    lsof
