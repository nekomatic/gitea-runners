#!/bin/bash
set -euo pipefail
VAULT_VERSION=1.15.0
curl -sLo vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
unzip vault.zip
strip vault
mv vault /usr/local/bin/vault
chmod +x /usr/local/bin/vault
rm vault.zip
