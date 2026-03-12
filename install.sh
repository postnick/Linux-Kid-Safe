#!/usr/bin/env bash
set -e

echo "Linux Kid Safe Setup"
echo "--------------------"

if [ "$EUID" -ne 0 ]; then
  echo "Run as root"
  exit 1
fi

DISTRO="unknown"

if [ -f /etc/debian_version ]; then
  DISTRO="debian"
elif [ -f /etc/fedora-release ]; then
  DISTRO="fedora"
elif [ -f /etc/arch-release ]; then
  DISTRO="arch"
fi

echo "Detected distro: $DISTRO"

case $DISTRO in
  debian)
    bash distro/debian.sh
    ;;
  fedora)
    bash distro/fedora.sh
    ;;
  arch)
    bash distro/arch.sh
    ;;
  *)
    echo "Unsupported distro"s
    exit 1
esac

bash modules/users.sh
bash modules/gnome_lockdown.sh
bash modules/network_lockdown.sh
bash modules/browser_lockdown.sh

echo "Setup complete."
