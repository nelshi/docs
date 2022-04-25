---
layout: post
title: "Vigor to Telegraf"
date: 2022-04-06 09:00:00 +0000
categories: docker python modem draytek #Space Separated
tags: docker python vigor modem draytek telegraf #Space Separated
---

# Vigor to Telegraf

## Installation

1. Copy script `vigor-to-telegraf.py` to a directory accessible by Telegraf
2. Make the script executable `chmod +x vigor-to-telegraf.py`
3. Edit the script variables

```
username = "admin"
password = "admin"
host = '192.168.100.1'
timeout = 2
```
4. Append the Input to `telegraf.conf`

```
[[inputs.exec]]
  commands = ["python3 /opt/telegraf/vigor-to-telegraf.py"]
  timeout = "15s"
  data_format = "influx"
```
5a. Ensure Telegraf has Python accessible (Install if in Docker Container)

```sh
apt-get upgrade -y && apt-get install -y python3 python3-pip
```

5b. Restart telegraf

## Script

`vigor-to-telegraf.py`

```ps
{% include /python/vigor-to-telegraf.py %}
```