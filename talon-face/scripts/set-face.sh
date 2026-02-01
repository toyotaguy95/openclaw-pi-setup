#!/bin/bash
# Quick command to set Talon's face state
# Usage: set-face.sh <state>
# States: idle, thinking, speaking, working, sleeping

STATE_FILE="$HOME/talon-face/state"
VALID_STATES="idle thinking speaking working sleeping"

if [ -z "$1" ]; then
    echo "Usage: set-face.sh <state>"
    echo "States: $VALID_STATES"
    echo "Current: $(cat $STATE_FILE 2>/dev/null || echo 'unknown')"
    exit 1
fi

STATE="$1"

# Validate state
if ! echo "$VALID_STATES" | grep -qw "$STATE"; then
    echo "Invalid state: $STATE"
    echo "Valid states: $VALID_STATES"
    exit 1
fi

echo "$STATE" > "$STATE_FILE"
echo "🦞 Face set to: $STATE"
