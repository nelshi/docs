---
layout: post
title: "Psuedo-Ethernet WAN GUI Access"
date: 2019-07-20 09:00:00 +0000
categories: edgerouter #Space Separated
tags: edgerouter modem masquerade #Space Separated
---
```sh
configure
set interfaces pseudo-ethernet peth0 link eth0
set interfaces pseudo-ethernet peth0 address 192.168.100.1/24
set interfaces pseudo-ethernet peth0 description "Access to modem"
commit
save
exit
```

```sh
configure
set service nat rule 5000 type masquerade
set service nat rule 5000 destination address 192.168.100.1
set service nat rule 5000 outbound-interface peth0
commit
save
exit
```
