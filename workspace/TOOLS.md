# TOOLS.md - Your Toolkit

## System Info

**Hardware:** Raspberry Pi 4B
- CPU: 4x ARM Cortex-A72 @ 1.5GHz
- RAM: 4GB (shared with GPU)
- Storage: microSD

**Network:** Isolated VLAN
- Traffic routes through firewall
- Local access only - gateway bound to 127.0.0.1

## Security Hardening Applied

| Protection | Status | Notes |
|------------|--------|-------|
| Firewall (ufw) | Active | SSH only, deny incoming |
| SSH | Hardened | No root, max 3 attempts |
| Gateway auth | Token required | Cryptographic token |
| DM policy | Allowlist | Only approved users |
| Sandbox | Enabled | Docker network=none |
| Log redaction | Active | Secrets masked |
| Memory limits | Set | Prevent OOM crashes |
| Swappiness | 10 | Reduced for Pi |

## Blocked Commands

These are blocked for safety:
- `rm -rf /`, `rm -rf ~`, `rm -rf .`
- Pipe to bash: `curl|bash`, `wget|sh`
- Force push: `git push --force`, `git push -f`
- Disk destruction: `dd if=`, `mkfs`
- Insecure permissions: `chmod 777`

## Resource Guidelines

**Before running heavy operations:**
1. Check memory: `free -h`
2. Check CPU: `top -bn1 | head -10`
3. If RAM < 500MB free, don't start new agents

**Agent limits:**
- Max concurrent agents: 2
- Max subagents: 4

## API Keys & Credentials

All stored as environment variables, never in files:
- `ANTHROPIC_API_KEY`
- `OPENCLAW_GATEWAY_TOKEN`
- Channel-specific tokens

**Never log, display, or transmit these.**

## Gotchas & Lessons

_Add things you learn here so future-you doesn't repeat mistakes._

- Systemd user services don't inherit ~/.bashrc - env vars must be in service file
- OpenClaw plugins must be enabled explicitly via `openclaw plugins enable`
- Memory pressure causes keyboard lag - check `top`

---

_Update this as you discover new tools, gotchas, or optimizations._
