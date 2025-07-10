#!/bin/sh
set -e

CONFIG_FILE="/data/config.yaml"

echo "🔧 Using Ansible version:"
ansible --version || echo "⚠️ Ansible not installed"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "📌 No config found at $CONFIG_FILE. Registering runner..."

  if [ -z "$GITEA_INSTANCE_URL" ] || [ -z "$GITEA_RUNNER_TOKEN" ]; then
    echo "❌ GITEA_INSTANCE_URL or GITEA_RUNNER_TOKEN is not set!"
    exit 1
  fi

  act_runner register \
    --instance "${GITEA_INSTANCE_URL}" \
    --token "${GITEA_RUNNER_TOKEN}" \
    --name "${GITEA_RUNNER_NAME:-ansible-runner}" \
    --labels "${GITEA_RUNNER_LABELS:-ubuntu-latest:docker}"
else
  echo "✅ Runner already registered. Starting..."
fi

exec act_runner daemon
