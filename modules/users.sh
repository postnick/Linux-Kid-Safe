#!/usr/bin/env bash

## Need to check or create a new user group for kids if for multipe users.


read -p "Enter kid username: " KIDUSER

useradd -m "$KIDUSER"
passwd "$KIDUSER"

gpasswd -d "$KIDUSER" wheel 2>/dev/null || true
gpasswd -d "$KIDUSER" sudo 2>/dev/null || true

echo "User created without admin privileges."
