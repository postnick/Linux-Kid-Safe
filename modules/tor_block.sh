#!/usr/bin/env bash
echo "Blocking TOR ports"
iptables -A OUTPUT -p tcp --dport 9050 -j REJECT || true
iptables -A OUTPUT -p tcp --dport 9150 -j REJECT || true
