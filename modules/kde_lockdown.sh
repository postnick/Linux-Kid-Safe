#!/usr/bin/env bash

mkdir -p /etc/xdg

cat <<EOF > /etc/xdg/kdeglobals
[KDE Action Restrictions]
shell_access=false
EOF

echo "KDE restrictions applied."
