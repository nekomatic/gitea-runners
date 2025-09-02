#!/bin/bash
set -euo pipefail
apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    binutils
