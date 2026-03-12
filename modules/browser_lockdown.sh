#!/usr/bin/env bash

FIREFOX_DIR="/usr/lib64/firefox/distribution"

if [ ! -d "$FIREFOX_DIR" ]; then
  FIREFOX_DIR="/usr/lib/firefox/distribution"
fi

mkdir -p "$FIREFOX_DIR"

cat <<EOF > "$FIREFOX_DIR/policies.json"
{
  "policies": {
    "DisablePrivateBrowsing": true,
    "BlockAboutConfig": true,
    "DNSOverHTTPS": {
      "Enabled": false
    }
  }
}
EOF

echo "Firefox policies applied."
