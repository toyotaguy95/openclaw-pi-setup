#!/bin/bash
# System hardening script for Raspberry Pi + OpenClaw
# Run with sudo

set -e

echo "=== OpenClaw Pi Hardening Script ==="

# Memory optimization
echo "Configuring memory settings..."
sysctl -w vm.swappiness=10
sysctl -w vm.vfs_cache_pressure=50
cp config/sysctl-optimization.conf /etc/sysctl.d/99-pi-optimization.conf

# Firewall setup
echo "Configuring firewall..."
apt-get install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

# SSH hardening
echo "Hardening SSH..."
cp config/sshd-hardening.conf /etc/ssh/sshd_config.d/hardening.conf
systemctl restart sshd

# Resource limits
echo "Setting resource limits..."
cat > /etc/security/limits.d/99-openclaw-limits.conf << 'EOF'
# Resource limits for OpenClaw user
*    soft    nproc     200
*    hard    nproc     250
*    soft    nofile    4096
*    hard    nofile    8192
EOF

echo "=== Hardening complete ==="
echo "Reboot recommended to apply all changes."
