---
name: face-thinking
description: "Sets face to thinking when agent starts processing"
metadata: { "openclaw": { "emoji": "🤔", "events": ["agent:bootstrap"] } }
---

# Face Thinking Hook

Sets Talon's face to `thinking` whenever a new message triggers agent processing.

## What It Does

1. Fires when agent:bootstrap event occurs (message received, agent starting)
2. Sets face state to "thinking"
3. Face display shows the thinking animation

The agent is responsible for setting face back to `idle` when done responding.
