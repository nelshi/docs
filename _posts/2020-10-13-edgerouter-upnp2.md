---
layout: post
title: "Edgerouter UPnP2 Configuration"
date: 2020-10-13 09:00:00 +0000
categories: edgerouter #Space Separated
tags: edgerouter upnp2 upnp open nat #Space Separated
---

# Edgerouter UPnP2 Configuration

## Delete Existing UPnP

```sh
configure
delete service upnp
commit
save
exit
```

## Enable UPnP2 for LAN (switch0)

```sh
configure
set service upnp2 listen-on switch0
set service upnp2 wan pppoe0
set service upnp2 secure-mode enable
set service upnp2 nat-pmp enable
commit
save
exit
```

## Open NAT Xbox

```sh
configure
set service upnp2 acl rule 10 action deny
set service upnp2 acl rule 10 external-port 3074
set service upnp2 acl rule 10 local-port 0-65535
set service upnp2 acl rule 10 subnet 10.0.0.0/24
set service upnp2 acl rule 10 description Xbox 3074 Deny
commit
save
exit
```
