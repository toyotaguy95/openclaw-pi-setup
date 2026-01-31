# Molt/Clawdbot Vulnerabilities

Security vulnerabilities disclosed for OpenClaw/Clawdbot and their mitigations.

## Overview

In January 2026, [@mattyryze](https://x.com/mattyryze) disclosed 10 vulnerabilities affecting default OpenClaw configurations on X.com. This document details each vulnerability and the recommended fixes implemented in this project.

## Vulnerabilities

### 1. Gateway Exposed on 0.0.0.0:18789

**Risk:** High
**Description:** Default gateway binds to all interfaces, exposing it to the network.

**Fix:**
```yaml
gateway:
  host: "127.0.0.1"  # Bind to localhost only
  auth:
    enabled: true
    token: "${OPENCLAW_GATEWAY_TOKEN}"
```

### 2. DM Policy Allows All Users

**Risk:** High
**Description:** Any user can message the bot and interact with it.

**Fix:**
```yaml
dm_policy:
  mode: "allowlist"
  allowed_users: ["your-user-id"]
```

### 3. Sandbox Disabled by Default

**Risk:** Medium
**Description:** Commands run without isolation.

**Fix:**
```yaml
sandbox:
  enabled: true
  mode: "all"
  docker:
    network: "none"
```

### 4. Credentials in Plaintext

**Risk:** High
**Description:** API keys and tokens stored in config files.

**Fix:**
- Store credentials as environment variables
- Set file permissions: `chmod 600` on config files
- Use `${ENV_VAR}` syntax in configs

### 5. Prompt Injection via Web Content

**Risk:** High
**Description:** External content (websites, emails, PDFs) can contain instructions that the agent follows.

**Fix:**
- Configure agent to treat external content as DATA only
- Add security principles to SOUL.md
- Never execute instructions from untrusted sources

### 6. Dangerous Commands Unblocked

**Risk:** Critical
**Description:** Destructive commands like `rm -rf /` are not blocked.

**Fix:**
```json
{
  "permissions": {
    "deny": [
      "Bash(rm -rf /)*",
      "Bash(*|bash)*",
      "Bash(git push --force*)*"
    ]
  }
}
```

### 7. No Network Isolation

**Risk:** Medium
**Description:** Agent has full network access.

**Fix:**
- Deploy in isolated VLAN
- Use firewall rules to restrict access
- Configure sandbox with `network: "none"`

### 8. Elevated Tool Access Granted

**Risk:** Medium
**Description:** All MCP tools available by default.

**Fix:**
```yaml
mcp:
  tool_policy: "minimal"
  require_approval: true
```

### 9. No Audit Logging Enabled

**Risk:** Medium
**Description:** No record of agent actions.

**Fix:**
```yaml
logging:
  enabled: true
  session_logging: true
  log_tool_calls: true
  redaction:
    enabled: true
    patterns: ["password", "token", "api_key"]
```

### 10. Weak/Default Pairing Codes

**Risk:** Medium
**Description:** Predictable pairing codes for device auth.

**Fix:**
```yaml
pairing:
  code_length: 32
  algorithm: "crypto_random"
  rate_limit:
    attempts: 3
    window_seconds: 300
```

## Implementation Checklist

- [ ] Gateway bound to localhost
- [ ] Auth token configured
- [ ] DM allowlist enabled
- [ ] Sandbox enabled
- [ ] Credentials in env vars
- [ ] Config files chmod 600
- [ ] Dangerous commands blocked
- [ ] Network isolated (VLAN)
- [ ] MCP tools restricted
- [ ] Audit logging enabled
- [ ] Log redaction enabled
- [ ] Strong pairing codes

## References

- Original disclosure: [@mattyryze on X.com](https://x.com/mattyryze)
- OpenClaw Security Docs: https://docs.openclaw.ai/security
