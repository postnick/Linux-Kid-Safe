#!/usr/bin/env bash
echo "Disabling user Flatpak installs"
flatpak config --system --set no-user-installations true || true
mkdir -p /etc/flatpak/installations.d
cat <<EOF >/etc/flatpak/installations.d/no-user.conf
[Installation "default"]
NoUserInstallations=true
EOF
