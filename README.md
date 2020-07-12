# WineCLI Container

This container is useful for running Windows apps that are either headless, or CLI only.

## Exmaple

```
04:29 $ docker run -it --rm legacylanparty/winecli:latest ipconfig
Ethernet adapter lo

    Connection-specific DNS suffix. . :
    IPv4 address. . . . . . . . . . . : 127.0.0.1
    Default gateway . . . . . . . . . :

Unknown adapter tunl0

    Connection-specific DNS suffix. . :
    Default gateway . . . . . . . . . :

Unknown adapter ip6tnl0

    Connection-specific DNS suffix. . :
    Default gateway . . . . . . . . . :

Ethernet adapter eth0

    Connection-specific DNS suffix. . :
    IPv4 address. . . . . . . . . . . : 172.17.0.2
    Default gateway . . . . . . . . . : 172.17.0.1
```