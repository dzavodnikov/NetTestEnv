FROM ubuntu:22.04

RUN apt-get update

# Install network tools.
RUN apt-get install -y iproute2 curl iputils-ping traceroute net-tools iptables

# Install Python 3.10.
RUN apt-get install -y python3 python-is-python3

COPY init/hostname_server.py /opt

# ENTRYPOINT will be defined by Docker Compose
# CMD bash
