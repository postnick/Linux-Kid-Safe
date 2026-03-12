#!/usr/bin/env bash

read -p "Enter kid username: " KIDUSER

if id "$KIDUSER" &>/dev/null; then
  echo "User already exists. Skipping creation."
  exit 0
fi

useradd -m "$KIDUSER"
passwd "$KIDUSER"

gpasswd -d "$KIDUSER" wheel 2>/dev/null || true
gpasswd -d "$KIDUSER" sudo 2>/dev/null || true

echo "User $KIDUSER created without admin privileges."