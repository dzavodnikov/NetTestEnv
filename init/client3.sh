#!/usr/bin/env bash

# IP confugure (see `route -n`).
route delete    default gw 192.168.0.1 eth0
route add       default gw 192.168.0.2 eth0

# Create test service.
python /opt/hostname_server.py --port 8080
