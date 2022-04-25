---
layout: post
title: "UISP Docker Container"
date: 2022-04-22 09:00:00 +0000
categories: docker unifi #Space Separated
tags: docker unifi uisp edgerouter #Space Separated
---

# Docker UISP (formerly UNMS)

This is an all-in-one Docker image for running the [Ubiquiti Network Management System](https://uisp.ui.com/). This image contains all the components required to run [UISP](https://uisp.ui.com/) in a single container and uses the [s6-overlay](https://github.com/just-containers/s6-overlay) for process management.

## Usage

```shell
docker run \
  -p 80:80 \
  -p 443:443 \
  -p 2055:2055/udp \
  -e TZ=<timezone> \
  -v /home/docker/uisp:/config \
  nico640/docker-unms:latest
```

## Raspberry Pi / ARM

This image will also allow you to run [UISP](https://uisp.ui.com/) on a Raspberry Pi or other Docker-enabled ARMv7/8 devices.

```
docker run -d --name uisp -p 80:80 -p 443:443 -p 2055:2055/udp -v /home/docker/uisp:/config nico640/docker-unms:latest
```

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.

* `-v </path/to/config>:/config` - The persistent data location, the database, certs and logs will be stored here
* `-p 80:80` - Expose the HTTP web server port on the docker host
* `-p 443:443` - Expose the HTTPS and WSS web server port on the docker host
* `-p 2055:2055/udp` - Expose the Netflow port on the docker host
* `-e TZ=Europe/London` - for [timezone information](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

*Optional Settings:*

* `-e DEMO=false` - Enable UISP demo mode
* `-e PUBLIC_HTTPS_PORT=443` - This should match the HTTPS port your are exposing to on the docker host
* `-e PUBLIC_WS_PORT=443` - This should match the HTTPS port your are exposing to on the docker host
* `-e SSL_CERT=` - Filename of custom SSL certificate in /config/usercert/
* `-e SSL_CERT_KEY=` - Filename of custom SSL key in /config/usercert/
* `-e PUID=911` - User ID of the container user
* `-e PGID=911` - Group ID of the container user

## Limitations

* In-app upgrades will not work. You can upgrade UISP by downloading the latest version of this image.

## Docker Compose

```yml
{% include /docker-compose/docker-compose-uisp.yml %}
```