#!/bin/bash
# Backup Talon's configuration for restore to new Pi
# Usage: backup-talon.sh [backup-dir]

set -e

BACKUP_DIR="${1:-$HOME/talon-backup-$(date +%Y%m%d-%H%M%S)}"

echo "🦞 Talon Backup Script"
echo "====================="
echo "Backing up to: $BACKUP_DIR"
echo ""

mkdir -p "$BACKUP_DIR"

# 1. OpenClaw config and workspace
echo "→ Backing up OpenClaw config..."
cp -r ~/.openclaw/config.yaml "$BACKUP_DIR/"
cp -r ~/.openclaw/workspace "$BACKUP_DIR/"
cp -r ~/.openclaw/hooks "$BACKUP_DIR/" 2>/dev/null || echo "  (no custom hooks)"

# 2. Claude settings
echo "→ Backing up Claude settings..."
mkdir -p "$BACKUP_DIR/claude"
cp ~/.claude/settings.json "$BACKUP_DIR/claude/" 2>/dev/null || true

# 3. Face display
echo "→ Backing up face display..."
cp -r ~/talon-face "$BACKUP_DIR/"

# 4. Systemd services
echo "→ Backing up systemd services..."
mkdir -p "$BACKUP_DIR/systemd"
cp ~/.config/systemd/user/openclaw-gateway.service "$BACKUP_DIR/systemd/" 2>/dev/null || true
cp ~/.config/systemd/user/talon-face.service "$BACKUP_DIR/systemd/" 2>/dev/null || true

# 5. Scripts
echo "→ Backing up scripts..."
cp -r ~/scripts "$BACKUP_DIR/" 2>/dev/null || true

# 6. Document required secrets (don't backup actual values!)
echo "→ Documenting required secrets..."
cat > "$BACKUP_DIR/SECRETS-NEEDED.txt" << 'EOF'
# Secrets Required for Restore
# ============================
# These are NOT backed up for security. You must set them manually.

# Add to ~/.bashrc or systemd service files:
export ANTHROPIC_API_KEY="your-api-key"
export TELEGRAM_BOT_TOKEN="your-bot-token"
export OPENCLAW_GATEWAY_TOKEN="generate-new-32char-token"

# Generate new gateway token:
# openssl rand -hex 32
EOF

# 7. Create restore script
echo "→ Creating restore script..."
cat > "$BACKUP_DIR/restore-talon.sh" << 'RESTORE'
#!/bin/bash
# Restore Talon configuration from backup
# Run this on a fresh Pi after installing OpenClaw

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🦞 Talon Restore Script"
echo "======================"
echo ""

# Check OpenClaw is installed
if ! command -v openclaw &>/dev/null; then
    echo "ERROR: OpenClaw not installed. Run the installer first:"
    echo "  curl -fsSL https://install.openclaw.ai | bash"
    exit 1
fi

echo "→ Restoring OpenClaw config..."
cp "$SCRIPT_DIR/config.yaml" ~/.openclaw/
cp -r "$SCRIPT_DIR/workspace" ~/.openclaw/
cp -r "$SCRIPT_DIR/hooks" ~/.openclaw/ 2>/dev/null || true

echo "→ Restoring Claude settings..."
mkdir -p ~/.claude
cp "$SCRIPT_DIR/claude/settings.json" ~/.claude/ 2>/dev/null || true

echo "→ Restoring face display..."
cp -r "$SCRIPT_DIR/talon-face" ~/

echo "→ Restoring systemd services..."
mkdir -p ~/.config/systemd/user
cp "$SCRIPT_DIR/systemd/"*.service ~/.config/systemd/user/ 2>/dev/null || true
systemctl --user daemon-reload

echo "→ Restoring scripts..."
cp -r "$SCRIPT_DIR/scripts" ~/ 2>/dev/null || true
chmod +x ~/scripts/*.sh ~/talon-face/scripts/*.sh 2>/dev/null || true

echo ""
echo "✓ Restore complete!"
echo ""
echo "NEXT STEPS:"
echo "1. Add secrets to ~/.bashrc (see SECRETS-NEEDED.txt)"
echo "2. Source bashrc: source ~/.bashrc"
echo "3. Update systemd services with API key"
echo "4. Enable services:"
echo "   systemctl --user enable --now openclaw-gateway"
echo "   systemctl --user enable --now talon-face"
echo "5. Approve Telegram pairing: openclaw pairing approve telegram <code>"
RESTORE

chmod +x "$BACKUP_DIR/restore-talon.sh"

# 8. Create tarball
echo ""
echo "→ Creating compressed archive..."
TARBALL="$BACKUP_DIR.tar.gz"
tar -czf "$TARBALL" -C "$(dirname $BACKUP_DIR)" "$(basename $BACKUP_DIR)"

# Summary
BACKUP_SIZE=$(du -sh "$BACKUP_DIR" | cut -f1)
TAR_SIZE=$(du -sh "$TARBALL" | cut -f1)

echo ""
echo "✓ Backup complete!"
echo ""
echo "  Directory: $BACKUP_DIR ($BACKUP_SIZE)"
echo "  Archive:   $TARBALL ($TAR_SIZE)"
echo ""
echo "To restore on new Pi:"
echo "  1. Copy $TARBALL to new Pi"
echo "  2. tar -xzf $(basename $TARBALL)"
echo "  3. cd $(basename $BACKUP_DIR)"
echo "  4. ./restore-talon.sh"
echo "  5. Add your secrets (see SECRETS-NEEDED.txt)"
