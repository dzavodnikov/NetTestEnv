#!/usr/bin/env bash

# IP confugure (see `route -n`).
#ip address add 10.0.0.154/29 dev eth0
ip address add 10.0.0.155/29 dev eth0
ip address add 10.0.0.156/29 dev eth0
ip address add 10.0.0.157/29 dev eth0
ip address add 10.0.0.158/29 dev eth0

# Create test service.
python /opt/hostname_server.py --port 8080
