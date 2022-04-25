---
layout: post
title: "Commandline Static IP Assignment"
date: 2019-06-14 09:00:00 +0000
categories: rmm script #Space Separated
tags: rmm script cmd dns ip netsh #Space Separated
---

# Commandline Static IP Assignment

Remotely edit the Static IP Address of a specific interface on a client machine.

```sh
netsh interface ipv4 show address
netsh int ip set address "Ethernet" static 192.168.1.100 255.255.255.0 192.168.1.254 1
```