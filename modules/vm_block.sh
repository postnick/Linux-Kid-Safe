#!/usr/bin/env bash
echo "Removing virtualization tools"
PKGS="virtualbox qemu virt-manager"
for p in $PKGS; do
  if command -v apt >/dev/null; then apt remove -y $p || true; fi
  if command -v dnf >/dev/null; then dnf remove -y $p || true; fi
  if command -v pacman >/dev/null; then pacman -R --noconfirm $p || true; fi
done
