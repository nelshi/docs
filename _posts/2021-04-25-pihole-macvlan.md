---
layout: post
title: "PiHole MACVLAN Network Creation"
date: 2021-04-25 09:00:00 +0000
categories: pi docker #Space Separated
tags: pi pihole macvlan bridge network docker #Space Separated
---
# Pi-Hole Docker macvlan Network Setup

## Create Network
```sh
ip link add macvlan0 link eth0 type macvlan mode bridge
ip addr add 192.168.1.9 dev macvlan0
ip link set macvlan0 up
docker network create --driver=macvlan --gateway=192.168.1.254 --subnet=192.168.1.1/24 -o parent=eth0 macvlan0
```
