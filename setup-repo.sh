#!/bin/bash
# Solara PKGS Setup Script
# Run this on your Solara installation

set -e

echo "🌅 Setting up Solara PKGS..."

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "Run with sudo!"
   exit 1
fi

# Backup existing pacman.conf
cp /etc/pacman.conf /etc/pacman.conf.backup

# Add Solara PKGS repo
if ! grep -q "\[solara-pkgs\]" /etc/pacman.conf; then
    echo '
[solara-pkgs]
SigLevel = Optional TrustAll
Server = https://raw.githubusercontent.com/ravecorelabs/solara-pkgs/main/$arch' >> /etc/pacman.conf
    echo "✅ Added solara-pkgs to pacman.conf"
else
    echo "ℹ️  solara-pkgs already in pacman.conf"
fi

# Sync
pacman -Sy

# Install yay (AUR helper)
echo "📦 Installing yay..."
pacman -S --noconfirm yay

echo ""
echo "🌅 Solara PKGS ready!"
echo ""
echo "Install packages with:"
echo "  sudo pacman -S yay          # AUR helper"
echo "  sudo pacman -S pantheon-desktop  # Pantheon DE"
echo ""
echo "For more: https://github.com/ravecorelabs/solara-pkgs"