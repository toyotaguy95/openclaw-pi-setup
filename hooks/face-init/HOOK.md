---
name: face-init
description: "Sets Talon's face to idle on gateway startup"
metadata: { "openclaw": { "emoji": "🦞", "events": ["gateway:startup"] } }
---

# Face Init Hook

Sets Talon's lobster face display to `idle` state when the OpenClaw gateway starts.

## What It Does

1. Writes "idle" to the face state file
2. Face display service picks up the change
3. Talon wakes up looking ready

## Requirements

- `~/talon-face/state` file must exist
- `talon-face.service` should be running
