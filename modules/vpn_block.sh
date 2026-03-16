#!/usr/bin/env bash
echo "Blocking VPN creation through NetworkManager polkit"
mkdir -p /etc/polkit-1/rules.d
cat <<EOF >/etc/polkit-1/rules.d/60-vpn-block.rules
polkit.addRule(function(action, subject) {
    if (action.id.indexOf("org.freedesktop.NetworkManager.settings.modify") === 0) {
        return polkit.Result.AUTH_ADMIN;
    }
});
EOF