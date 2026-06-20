FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 \
    && mkdir -pm755 /etc/apt/keyrings \
    && curl -sLo /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
    && curl -sLo /etc/apt/sources.list.d/winehq-noble.sources \
        https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources \
    && apt-get update -qq \
    && apt-get install --install-recommends -y winehq-stable iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
