#!/bin/bash
set -euo pipefail
apt-get purge -y build-essential libssl-dev libffi-dev
apt-get autoremove -y
