---
layout: post
title: "unRAID Wake on LAN"
date: 2022-05-01 09:00:00 +0000
categories: unraid #Space Separated
tags: unraid wol wake lan #Space Separated
---

# unRAID Wake on LAN

User script to force enable Wake on LAN every time unRAID server shuts down.

> Must be enabled within BIOS already (Power on via PCIe/LAN)
{: .prompt-danger }

> Requires the 'User Scripts' Community Apps Plugin
{: .prompt-warning }

- Settings  
    - User Scripts  
        - Add New Script

`activate-wol`

```sh
#!/bin/bash
ethtool -s eth0 wol g
```

Run in background: `At Startup of Array`

## Example WoL Client Configuration

```
Profile:    unRAID
IP:         10.0.0.11
Port:       9
MAC Addr:   XX:XX:XX:XX:XX:XX
```