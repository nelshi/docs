---
layout: post
title: "unRAID Root Share"
date: 2022-05-05 09:00:00 +0000
categories: unraid #Space Separated
tags: unraid rootshare share smb #Space Separated
---

# unRAID Root Share

Enable a rootshare on unRAID to allow local moving of files between shares via another SMB client.  
Append the below to the existing configuration, replacing users as required.

- Settings
    - Network Services/SMB
        - SMB Extras

`Samba Extra Configuration`

```
{% include /misc-scripts/unraid-smb-extras.txt %}
```