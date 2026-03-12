#!/usr/bin/env bash
DNS="1.1.1.3"
echo "Enforcing DNS $DNS"
iptables -A OUTPUT -p udp --dport 53 -d $DNS -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j DROP
