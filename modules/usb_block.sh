#!/usr/bin/env bash
echo "Blocking USB storage devices"
mkdir -p /etc/udev/rules.d
cat <<EOF >/etc/udev/rules.d/99-usb-block.rules
SUBSYSTEM=="usb", ATTR{authorized}="0"
EOF
