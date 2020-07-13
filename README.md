# WineCLI Container

This container is useful for running Windows apps that are either headless, or CLI only.

## Example

```shell
$ docker run -it --rm legacylanparty/winecli:latest cmd.exe
Microsoft Windows 6.1.7601 (4.0.4)

Z:\app>exit
```

## Details

This container starts with Ubuntu 20.04 and then installs Wine 4.0.4 on top of it. It uses Xvfb to create a virtual X console, which allows Windows apps to draw visual elements _somewhere_, although you can't interact with them. This makes it so that you can use CLI apps that have trouble running when the Windows Desktop doesn't exist.

## Thanks

Inspired by the [domistyle/eldewrito container](https://hub.docker.com/r/domistyle/eldewrito).
