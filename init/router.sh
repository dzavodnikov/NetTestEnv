#!/usr/bin/env bash

# IP confugure (see `route -n`).
#ip address add 10.0.0.154/29 dev eth0
ip address add 10.0.0.155/29 dev eth0
ip address add 10.0.0.156/29 dev eth0
ip address add 10.0.0.157/29 dev eth0
ip address add 10.0.0.158/29 dev eth0

# Configure NAT.
iptables -t nat -A POSTROUTING  -o eth0 -j MASQUERADE
#iptables        -A FORWARD      -i eth1 -j ACCEPT

# Create test service.
python /opt/hostname_server.py --port 8080
