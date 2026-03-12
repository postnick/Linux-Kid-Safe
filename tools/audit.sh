#!/usr/bin/env bash

echo "Linux Kid Safe Security Audit"
echo "============================="

echo "Checking flatpak user installs..."
flatpak config --system | grep no-user-installations || echo "WARNING: flatpak user installs enabled"

echo "Checking DNS firewall rules..."
iptables -L OUTPUT | grep 53 || echo "WARNING: DNS not locked"

echo "Checking NetworkManager restrictions..."
ls /etc/polkit-1/rules.d | grep network || echo "WARNING: Network restrictions missing"

echo "Audit complete."
