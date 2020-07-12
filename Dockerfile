# Pull ubuntu image
FROM ubuntu:20.04

# Set environment variables
# WINEDLLOVERRIDES is required so wine doesn't ask any questions during setup
ENV WINEPREFIX="/wine" \
    WINEDLLOVERRIDES="mscoree,mshtml=" \
    DISPLAY=:1 \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

# Install Wine
RUN apt-get update && \
    apt-get install -y curl \
                       software-properties-common \
                       apt-transport-https && \
    dpkg --add-architecture i386 && \
    curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
    apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
    apt-get update && \
    apt-get install -y --install-recommends winehq-stable=4.0.4~focal \
                                            wine-stable=4.0.4~focal \
                                            wine-stable-amd64=4.0.4~focal \
                                            wine-stable-i386=4.0.4~focal \
                                            xvfb \
                                            winbind && \
    apt-get autoremove -y curl \
                          software-properties-common \
                          apt-transport-https && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf .cache/

# Initialize Wine
RUN Xvfb :1 -screen 0 320x240x24 & \
    wineboot -u
RUN rm /tmp/.X1-lock

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh

# Disable Wine debugging by default
ENV WINEDEBUG=-all

WORKDIR /app
VOLUME /app

CMD ["wine"]
ENTRYPOINT ["/entrypoint.sh"]