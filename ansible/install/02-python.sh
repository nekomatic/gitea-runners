#!/bin/bash
set -euo pipefail
apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python-is-python3 \
    python3-apt \
    python3-setuptools \
    python3-wheel \
    python3-venv
