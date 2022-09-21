---
layout: post
title: "RDP Server Shadow Remote Control Users"
date: 2022-07-03 09:00:00 +0000
categories: windows #Space Separated
tags: windows rdp remote control shadow #Space Separated
---

# RDP Server Shadow Remote Control Users

## Accessing

Server Manager - Remote Desktop Services - Collections

Right-Click on session to "Shadow"

## Policy

Default policy asks for user confirmation of Shadowing, which can be disabled via Group Policy

`Computer > Policies > Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Connections > Set rules for remote control of Remote Desktop Services user sessions`

`Full Control without user’s permission`