#!/bin/bash
set -euo pipefail
BW_VERSION=2024.6.0
curl -sLo /usr/local/bin/bw https://github.com/bitwarden/clients/releases/download/cli-v${BW_VERSION}/bw-linux
chmod +x /usr/local/bin/bw
