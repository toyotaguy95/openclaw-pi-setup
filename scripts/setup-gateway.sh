#!/bin/bash
# OpenClaw gateway setup script

set -e

echo "=== OpenClaw Gateway Setup ==="

# Check for required env vars
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "ERROR: ANTHROPIC_API_KEY not set"
    exit 1
fi

if [ -z "$OPENCLAW_GATEWAY_TOKEN" ]; then
    echo "Generating gateway token..."
    export OPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)
    echo "Add this to your ~/.bashrc:"
    echo "export OPENCLAW_GATEWAY_TOKEN=\"$OPENCLAW_GATEWAY_TOKEN\""
fi

# Configure gateway mode
echo "Configuring gateway..."
openclaw config set gateway.mode local
openclaw config set gateway.auth.token "$OPENCLAW_GATEWAY_TOKEN"
openclaw config set agents.defaults.maxConcurrent 2
openclaw config set agents.defaults.subagents.maxConcurrent 4

# Install and start gateway service
echo "Installing gateway service..."
openclaw gateway install
openclaw gateway start

# Check status
echo "Checking gateway status..."
sleep 3
openclaw gateway status

echo "=== Gateway setup complete ==="
