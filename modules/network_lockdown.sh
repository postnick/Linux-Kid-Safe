#!/usr/bin/env bash

mkdir -p /etc/polkit-1/rules.d

cat <<EOF > /etc/polkit-1/rules.d/50-network-lock.rules
polkit.addRule(function(action, subject) {
    if (action.id.indexOf("org.freedesktop.NetworkManager.settings.modify") === 0) {
        return polkit.Result.AUTH_ADMIN;
    }
});
EOF

echo "Network settings locked."
