#!/usr/bin/env bash
mkdir -p /etc/dconf/db/local.d /etc/dconf/db/local.d/locks

cat <<EOF >/etc/dconf/db/local.d/01-proxy-lock
[org/gnome/system/proxy]
mode='none'
EOF

echo "/org/gnome/system/proxy/mode" >/etc/dconf/db/local.d/locks/proxy-lock

dconf update
echo "Proxy settings locked"
