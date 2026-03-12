#!/usr/bin/env bash
set -e

TITLE="Linux Kid Safe Installer"

if [ "$EUID" -ne 0 ]; then
  echo "Run as root"
  exit 1
fi

echo "Linux Kid Safe Setup"
echo "--------------------"

############################################
# Detect distro
############################################

DISTRO="unknown"

if [ -f /etc/debian_version ]; then
  DISTRO="debian"
elif [ -f /etc/fedora-release ]; then
  DISTRO="fedora"
elif [ -f /etc/arch-release ]; then
  DISTRO="arch"
fi

echo "Detected distro: $DISTRO"

############################################
# Detect desktop environment
############################################

DESKTOP="unknown"

if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  DESKTOP="$XDG_CURRENT_DESKTOP"
elif [ -n "$DESKTOP_SESSION" ]; then
  DESKTOP="$DESKTOP_SESSION"
fi

echo "Detected desktop: $DESKTOP"


GNOME_OPTION="OFF"
KDE_OPTION="OFF"

if [[ "$DESKTOP" == *GNOME* ]]; then
  GNOME_OPTION="ON"
fi

if [[ "$DESKTOP" == *KDE* ]]; then
  KDE_OPTION="ON"
fi


"gnome" "GNOME lockdown policies" $GNOME_OPTION \
"kde" "KDE lockdown policies" $KDE_OPTION \


############################################
# Install distro dependencies
############################################

case $DISTRO in
  debian)
    bash distro/debian.sh
    apt install -y whiptail
    ;;
  fedora)
    bash distro/fedora.sh
    dnf install -y newt
    ;;
  arch)
    bash distro/arch.sh
    pacman -S --noconfirm libnewt
    ;;
  *)
    echo "Unsupported distro"
    exit 1
esac




############################################
# Module Menu
############################################

CHOICES=$(whiptail \
  --title "$TITLE" \
  --checklist "Select modules to install" 22 78 16 \
  "users" "Create kid user account" OFF \
  "gnome" "GNOME lockdown policies" OFF \
  "network" "NetworkManager restrictions" OFF \
  "browser" "Basic Firefox policies" OFF \
  "flatpak" "Disable Flatpak user installs" OFF \
  "vpn" "Block VPN creation" OFF \
  "proxy" "Lock proxy settings" OFF \
  "browserwhitelist" "Remove alternate browsers" OFF \
  "firefoxext" "Lock Firefox extensions" OFF \
  "tor" "Block TOR network ports" OFF \
  "dns" "Force DNS firewall rules" OFF \
  "usb" "Block USB storage devices" OFF \
  "vm" "Remove virtualization tools" OFF \
  "logging" "Enable activity logging" OFF \
  "audit" "Run security audit" OFF \
3>&1 1>&2 2>&3)

clear

############################################
# Run selected modules
############################################

for choice in $CHOICES; do

  case $choice in

    "\"users\"")
      bash modules/users.sh
      ;;

    "\"gnome\"")
      bash modules/gnome_lockdown.sh
      ;;

    "\"network\"")
      bash modules/network_lockdown.sh
      ;;

    "\"browser\"")
      bash modules/browser_lockdown.sh
      ;;

    "\"flatpak\"")
      bash modules/flatpak_lockdown.sh
      ;;

    "\"vpn\"")
      bash modules/vpn_block.sh
      ;;

    "\"proxy\"")
      bash modules/proxy_lockdown.sh
      ;;

    "\"browserwhitelist\"")
      bash modules/browser_whitelist.sh
      ;;

    "\"firefoxext\"")
      bash modules/firefox_extension_lock.sh
      ;;

    "\"tor\"")
      bash modules/tor_block.sh
      ;;

    "\"dns\"")
      bash modules/dns_firewall.sh
      ;;

    "\"usb\"")
      bash modules/usb_block.sh
      ;;

    "\"vm\"")
      bash modules/vm_block.sh
      ;;

    "\"logging\"")
      bash modules/activity_logging.sh
      ;;

    "\"audit\"")
      bash tools/audit.sh
      ;;

  esac

done

echo ""
echo "Linux Kid Safe setup complete."