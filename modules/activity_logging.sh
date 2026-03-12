#!/usr/bin/env bash
LOG=/var/log/linux-kid-safe.log
touch $LOG
chmod 600 $LOG
echo "Logging enabled at $LOG"
