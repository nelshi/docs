---
layout: post
title: "Commandline DNS Change"
date: 2019-06-14 09:00:00 +0000
categories: rmm script #Space Separated
tags: rmm script cmd dns ip netsh #Space Separated
---

# Commandline DNS Change

Remotely edit the DNS of a specific interface on a client machine.

```sh
netsh interface ipv4 show address
netsh interface ip set dns name="Wi-Fi" static 1.1.1.1
netsh interface ip add dns name="Wi-Fi" 8.8.8.8 index=2
```