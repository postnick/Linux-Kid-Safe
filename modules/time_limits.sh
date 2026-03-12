#!/usr/bin/env bash
USER=$1
START=$2
END=$3

echo "login ; * ; $USER ; Al${START}-${END}" >> /etc/security/time.conf
echo "Time limits applied for $USER"
