#!/usr/bin/env bash

mkdir -p /etc/dconf/db/local.d
mkdir -p /etc/dconf/db/local.d/locks

cat <<EOF > /etc/dconf/db/local.d/00-kid-lockdown
[org/gnome/desktop/lockdown]
disable-command-line=true
disable-user-switching=true
disable-printing=true
disable-print-setup=true
EOF

cat <<EOF > /etc/dconf/db/local.d/locks/kid-lockdown
/org/gnome/desktop/lockdown/disable-command-line
/org/gnome/desktop/lockdown/disable-user-switching
/org/gnome/desktop/lockdown/disable-printing
/org/gnome/desktop/lockdown/disable-print-setup
EOF

dconf update

echo "GNOME lockdown applied."
