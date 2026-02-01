# OpenClaw Pi Setup - Secure AI Agent on Raspberry Pi

A hardened OpenClaw AI agent deployment on Raspberry Pi 4B with security-first configuration, network isolation, and resource optimization.

## Overview

This project documents the setup of an agentic AI assistant (OpenClaw) on a resource-constrained Raspberry Pi, with emphasis on:

- **Security hardening** against known vulnerabilities (OpenClaw)
- **Network isolation** via VLAN segmentation
- **Resource optimization** for 4GB RAM constraint
- **Custom agent personality** with security-conscious behavior

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        Home Network                              │
├─────────────────────────────────────────────────────────────────┤
│  Internet ──► ATT Gateway ──► TP-Link Switch ──► Pi Router      │
│                                    │              (Firewall)     │
│                                    │                  │          │
│                              VLAN Trunking           │          │
│                                    │                  │          │
│                              ┌─────┴─────┐           │          │
│                              │  VLAN 40  │◄──────────┘          │
│                              │ (AI Zone) │                       │
│                              └─────┬─────┘                       │
│                                    │                             │
│                         ┌─────────────────────┐                  │
│                         │   Raspberry Pi 4B   │                  │
│                         │  ┌───────────────┐  │                  │
│                         │  │   OpenClaw    │  │                  │
│                         │  │   Gateway     │  │                  │
│                         │  └───────┬───────┘  │                  │
│                         │          │          │                  │
│                         │  ┌───────┴───────┐  │                  │
│                         │  │     Chat      │  │                  │
│                         │  │   Channel     │  │                  │
│                         │  └───────────────┘  │                  │
│                         └─────────────────────┘                  │
└─────────────────────────────────────────────────────────────────┘
```

## Hardware

- **Device:** Raspberry Pi 4B (2018)
- **RAM:** 4GB
- **Storage:** 256GB microSD
- **Display:** HDMI monitor + 720x1280 DSI touch display
- **Network:** Ethernet (VLAN 40) or WiFi (portable mode)

## Talon Face Display

Animated lobster face on the touch display that reflects agent state:

| State | Animation | Trigger |
|-------|-----------|---------|
| `idle` | Gentle claw sway | Default/done processing |
| `thinking` | Eyes up, thought bubbles | Message received |
| `speaking` | Mouth animation | Sending response |
| `working` | Claws snipping | Running commands |
| `sleeping` | Closed eyes, zzz | Quiet hours |

**Auto-triggers via OpenClaw hooks:**
- `face-init` - Sets face to idle on gateway startup
- `face-thinking` - Sets face to thinking when processing messages (60s timeout fallback to idle)

## Security Hardening

### Vulnerabilities Addressed (OpenClaw)

| # | Vulnerability | Mitigation |
|---|---------------|------------|
| 1 | Gateway exposed on 0.0.0.0:18789 | Bound to 127.0.0.1 + token auth |
| 2 | DM policy allows all users | Allowlist mode with explicit users |
| 3 | Sandbox disabled by default | Enabled with docker network=none |
| 4 | Credentials in plaintext | Environment variables + chmod 600 |
| 5 | Prompt injection via web content | Untrusted content handling in agent config |
| 6 | Dangerous commands unblocked | Blocked rm -rf, curl\|bash, git push --force |
| 7 | No network isolation | VLAN 40 segmentation |
| 8 | Elevated tool access granted | Minimal MCP tool policy |
| 9 | No audit logging | Comprehensive session logging with redaction |
| 10 | Weak/default pairing codes | 32-char cryptographic random + rate limiting |

### System Hardening

| Component | Configuration |
|-----------|--------------|
| Firewall (ufw) | Default deny incoming, allow SSH only |
| SSH | No root login, max 3 attempts, no empty passwords |
| Memory | Swappiness=10, vfs_cache_pressure=50 |
| Process Limits | Max 250 processes, 3GB memory limit per user |
| Swap | zram with zstd compression (2GB) |

## Resource Optimization

Optimizations for running AI agents on 4GB RAM:

```yaml
# Agent limits (prevent OOM)
agents:
  defaults:
    maxConcurrent: 2      # Reduced from 4
    subagents:
      maxConcurrent: 4    # Reduced from 8

# Memory tuning
vm.swappiness: 10         # Reduce swap pressure
vm.vfs_cache_pressure: 50 # Keep file caches longer
```

## Skills Installed

| Skill | Source | Purpose |
|-------|--------|---------|
| proactive-agent | ClawHub | Anticipate needs, self-improvement |
| self-improving-agent | ClawHub | Log learnings and errors |
| agent-browser | ClawHub | Headless browser automation |
| docker-essentials | ClawHub | Container management reference |
| uptime-kuma | ClawHub | Server monitoring integration |
| weather | Bundled | Weather forecasts |
| coding-agent | Bundled | Code assistance |
| skill-creator | Bundled | Create new skills |
| video-frames | Bundled | Video frame extraction |

## Agent Personality

Custom workspace files define the agent's behavior:

- **SOUL.md** - Security-first identity, resource awareness
- **USER.md** - Human context and preferences
- **TOOLS.md** - Available tools, blocked commands, gotchas
- **MEMORY.md** - Long-term memory structure
- **HEARTBEAT.md** - Periodic check-in behavior
- **AGENTS.md** - Operating rules and workflows

See `workspace/` directory for templates.

## Installation

### Prerequisites

- Raspberry Pi 4B (4GB+ RAM recommended)
- Raspberry Pi OS (Debian-based)
- Network with VLAN capability (optional but recommended)

### Quick Start

```bash
# 1. Install OpenClaw
curl -fsSL https://openclaw.ai/install.sh | bash

# 2. Apply system hardening
sudo ./scripts/harden-system.sh

# 3. Configure OpenClaw
cp config/openclaw-config.yaml ~/.openclaw/config.yaml
cp -r workspace/* ~/.openclaw/workspace/

# 4. Set environment variables
export ANTHROPIC_API_KEY="your-key"
export TELEGRAM_BOT_TOKEN="your-token"
export OPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)

# 5. Start gateway
openclaw gateway install
openclaw gateway start

# 6. Enable Telegram
openclaw plugins enable telegram
openclaw channels add --channel telegram --token "$TELEGRAM_BOT_TOKEN"
```

## Project Structure

```
openclaw-pi-setup/
├── README.md
├── LICENSE
├── config/
│   ├── openclaw-config.yaml    # OpenClaw configuration (secrets redacted)
│   ├── claude-settings.json    # Claude CLI blocked commands
│   ├── sshd-hardening.conf     # SSH hardening config
│   └── sysctl-optimization.conf # Memory tuning
├── workspace/
│   ├── SOUL.md                 # Agent identity
│   ├── USER.md                 # Human context template
│   ├── TOOLS.md                # Tools and gotchas
│   ├── MEMORY.md               # Long-term memory
│   ├── HEARTBEAT.md            # Periodic checks
│   └── AGENTS.md               # Operating rules
├── talon-face/
│   ├── scripts/
│   │   ├── face-display.sh     # Display controller
│   │   ├── set-face.sh         # Manual state control
│   │   └── generate-lobster.sh # GIF generator
│   └── gifs/                   # Animated state GIFs (720x1280)
├── hooks/
│   ├── face-init/              # Gateway startup hook
│   └── face-thinking/          # Message processing hook
├── systemd/
│   └── talon-face.service      # Face display service
├── scripts/
│   ├── harden-system.sh        # System hardening script
│   ├── setup-gateway.sh        # Gateway setup script
│   └── backup-talon.sh         # Backup/restore script
└── docs/
    └── vulnerabilities.md      # Security details
```

## Lessons Learned

1. **Systemd user services don't inherit shell environment** - Environment variables must be added to the service file directly
2. **OpenClaw plugins are disabled by default** - Must explicitly enable with `openclaw plugins enable`
3. **Telegram pairing requires CLI approval** - Use `openclaw pairing approve`
4. **Memory pressure causes keyboard lag** - Monitor with `top` and reduce concurrent agents

## Technologies Used

- OpenClaw 2026.1.30
- Raspberry Pi OS (Debian 13 Trixie)
- Node.js 22.x
- systemd (user services)
- ufw (firewall)
- zram (compressed swap)

## Author

[@toyotaguy95](https://github.com/toyotaguy95)

## License

MIT License - See [LICENSE](LICENSE) for details.

## Portable Mode

Talon is designed to be portable - take it anywhere with power and WiFi:

1. **Auto-start on boot** - Services enabled with linger, no login required
2. **Face display** - Shows on touch screen automatically
3. **Telegram always on** - Message Talon from anywhere
4. **VLAN or WiFi** - Works on isolated network at home or WiFi on the go

```bash
# Backup before moving
~/scripts/backup-talon.sh

# On new location, just plug in power + WiFi
# Talon starts automatically and is reachable via Telegram
```

## Acknowledgments

- [OpenClaw](https://openclaw.ai) - AI agent framework
- [Anthropic](https://anthropic.com) - Claude AI
- [@mattyryze](https://x.com/mattyryze) - Security vulnerability disclosures
