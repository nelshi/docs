---
layout: post
title: "Remote CMD Shell Windows with PsExec"
date: 2022-06-24 09:00:00 +0000
categories: windows #Space Separated
tags: windows cmd remote #Space Separated
---

# Remote CMD Shell Windows with PsExec

## Installation

Download PsExec from [HERE](https://learn.microsoft.com/en-us/sysinternals/downloads/psexec)

Extract .zip locally to preferred folder

Open CMD in that location (via CMD `cd` or shift right-click "Open in Terminal")

Run the following to open up an interactive CMD on the remote machine (Alternatively replacing cmd.exe with powershell.exe)

```sh
.\PsExec.exe -i -h \\IPAddressOrName -u Username -p Password "cmd.exe"
```