---
layout: post
title: "Docker Container routing via VPN Connection"
date: 2022-05-15 09:00:00 +0000
categories: docker #Space Separated
tags: docker vpn openvpn container network #Space Separated
---

# Docker Container routing via VPN Connection

## VPN Container

Create and configure docker container to run the VPN Client itself that other containers will route through.

`ich777/openvpn-client`

Download and import `vpn.ovpn` file into container from VPN Provider

vpn.ovpn

```txt
# OpenVPN configuration file generated for ***** on Sun, 15 May 2022 09:00:00 +0000
# Contains your private access keys, do not share publicly!
# Edit at own risk!
```

Ensure the connection is established by attaching to the container and running:

```sh
curl ifconfig.io
```

This will return the WAN IP address of the container - check to ensure it is correctly showing the VPN address.


## Routing Containers

On any containers that need routing via the VPN Container, set the Network Type: None and add the Extra Parameter:  

`--net=container:OpenVPN-Client`