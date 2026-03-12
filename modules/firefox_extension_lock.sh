#!/usr/bin/env bash

DIR="/usr/lib64/firefox/distribution"
[ -d "$DIR" ] || DIR="/usr/lib/firefox/distribution"
mkdir -p "$DIR"

cat <<EOF >$DIR/policies.json
{
 "policies": {
   "DisablePrivateBrowsing": true,
   "BlockAboutConfig": true,
   "ExtensionSettings": {
     "*": {
       "installation_mode": "blocked"
     }
   }
 }
}
EOF
