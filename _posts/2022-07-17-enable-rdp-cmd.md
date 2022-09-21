---
layout: post
title: "Enable RDP from CMD"
date: 2022-07-17 09:00:00 +0000
categories: windows #Space Separated
tags: windows rdp #Space Separated
---

# Enable RDP from CMD

## Enable RDP

`reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f`

## Allow Firewall Access

`netsh advfirewall firewall set rule group="remote desktop" new enable=Yes`

## Disable RDP 

`reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f`

## Disallow Firewall Access

`netsh advfirewall firewall set rule group="remote desktop" new enable=No`