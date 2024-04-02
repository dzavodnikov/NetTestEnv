# Network Test Environment

This is Docker environment for testing configuration of network tools like
[iptables](https://linux.die.net/man/8/iptables/).

## Run

Start test environment:

```sh
$ docker compose up -d
```

Every host have port `8080` that return it's hostname:

```sh
$ docker exec -it router bash
$ curl localhost:8080
Current hostname is 'router'
$ curl 10.0.0.154:8080
Current hostname is 'router'
$ curl 172.16.0.2:8080
Current hostname is 'router'
$ curl 192.168.0.2:8080
Current hostname is 'router'
$ curl 172.16.0.101:8080
Current hostname is 'client-1'
$ curl 172.16.0.102:8080
Current hostname is 'client-2'
$ curl 192.168.0.103:8080
Current hostname is 'client-3'
$ exit
```

## Network scheme

```mermaid
flowchart TB
    host[["Host system"]]

    n1(("
        network1-isp
        10.0.0.152/29
    "))--- 10.0.0.153 -->host
    n2(("
        network2-local
        172.16.0.0/24
    "))--- 172.16.0.1 --xhost
    n3(("
        network3-local
        192.168.0.0/24
    "))--- 192.168.0.1 --xhost

    r("router")
    r<--
        eth0:
        10.0.0.154
        10.0.0.155
        10.0.0.156
        10.0.0.157
    -->n1
    r<--
        eth1:
        172.16.0.2
    -->n2
    r<--
        eth2:
        192.168.0.2
    -->n3

    c1("client-1")
        <-- 172.16.0.101 -->n2

    c2("client-2")
        <-- 172.16.0.102 -->n2

    c3("client-3")
        <-- 192.168.0.103 -->n3
```

## Links

-   [Use docker container as network gateway - Stack Overflow](https://stackoverflow.com/a/69055795/1095712)
-   [iptables(8) - Linux man page](https://linux.die.net/man/8/iptables/)

## Licenser

Distributed under MIT license.
