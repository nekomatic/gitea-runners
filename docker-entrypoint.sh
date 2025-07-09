#!/bin/bash

set -e

CONFIG_FILE="/data/config.yaml"

# Show Ansible version if installed
echo "🔧 Using Ansible version:"
ansible --version || echo "⚠️ Ansible not installed"

# Check if runner is already registered
if [ ! -f "$CONFIG_FILE" ]; then
  echo "📌 No config found at $CONFIG_FILE. Registering runner..."

  # Validate required environment variables
  if [ -z "$GITEA_INSTANCE_URL" ] || [ -z "$GITEA_RUNNER_TOKEN" ]; then
    echo "❌ GITEA_INSTANCE_URL or GITEA_RUNNER_TOKEN is not set!"
    exit 1
  fi

  /app/act_runner register \
    --instance "${GITEA_INSTANCE_URL}" \
    --token "${GITEA_RUNNER_TOKEN}" \
    --name "${GITEA_RUNNER_NAME:-ansible-runner}" \
    --labels "${GITEA_RUNNER_LABELS:-ubuntu-latest:docker}"
else
  echo "✅ Runner already registered. Starting..."
fi

# Start the runner daemon
exec /app/act_runner daemon
