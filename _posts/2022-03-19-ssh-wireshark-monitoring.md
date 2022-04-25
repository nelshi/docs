---
layout: post
title: "Wireshark over SSH"
date: 2022-03-19 09:00:00 +0000
categories: edgerouter #Space Separated
tags: edgerouter wireshark ssh monitor #Space Separated
---

# Traffic monitoring over SSH

## Linux

```sh
ssh ubnt@egderouter_ip 'sudo tcpdump -f -i eth0 -w -' | wireshark -k -i -
```

```sh
ssh ubnt@egderouter_ip 'sudo tcpdump -f -i eth0 -w - not port 22' | wireshark -k -i -
```

## Windows

```sh
ssh ubnt@egderouter_ip "sudo tcpdump -f -i eth0 -w -" | "C:\Program Files\Wireshark\Wireshark.exe" -k -i -
```
