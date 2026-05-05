#!/bin/bash
set -e

echo "Setting up Solara PKGS..."

if [[ $EUID -ne 0 ]]; then
   echo "Run with sudo!"
   exit 1
fi

cp /etc/pacman.conf /etc/pacman.conf.backup

if ! grep -q "\[solara-pkgs\]" /etc/pacman.conf; then
    cat >> /etc/pacman.conf << 'CONF'

[solara-pkgs]
SigLevel = Optional TrustAll
Server = https://github.com/ravecorelabs/solara-pkgs/releases/download/latest
CONF
    echo "Added solara-pkgs to pacman.conf"
else
    echo "solara-pkgs already in pacman.conf"
fi

pacman -Sy

echo "Solara PKGS ready!"
