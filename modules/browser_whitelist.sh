#!/usr/bin/env bash
echo "Removing alternate browsers"
BROWSERS="chromium chromium-browser brave-browser torbrowser-launcher"
for b in $BROWSERS; do
  if command -v apt >/dev/null; then apt remove -y $b || true; fi
  if command -v dnf >/dev/null; then dnf remove -y $b || true; fi
  if command -v pacman >/dev/null; then pacman -R --noconfirm $b || true; fi
done
