---
layout: post
title: "Vigor Modem to Prometheus"
date: 2022-04-07 09:00:00 +0000
categories: docker python modem draytek #Space Separated
tags: docker python vigor modem draytek prometheus #Space Separated
---

# Vigor Modem to Prometheus

A python script to read the detailed DrayTek router stats.

The following stats are recorded and presented as Open Metrics (Prometheus) stats.
```
> vdsl status more
  ---------------------- ATU-R Info (hw: annex A, f/w: annex A/B/C) -----------
                  Near End        Far End    Note
 Trellis      :      1               1
 Bitswap      :      1               1
 ReTxEnable   :      1               1
 VirtualNoise :      0               0
 20BitSupport :      0               0
 LatencyPath  :      0               0
 LOS          :      0               0
 LOF          :      0               0
 LPR          :      0               0
 LOM          :      0               0
 SosSuccess   :      0               0
 NCD          :      0               0
 LCD          :      0               0
 FECS         :      0            2575 (seconds)
 ES           :     35               3 (seconds)
 SES          :      3               1 (seconds)
 LOSS         :      0               0 (seconds)
 UAS          :     27            1861 (seconds)
 HECError     :      0               0
 CRC          :    126              31
 RsCorrection :      0               0
 INP          :    230             160 (symbols)
 InterleaveDelay :      0              62 (1/100 ms)
 NFEC         :     32              32
 RFEC         :     16              16
 LSYMB        :     16              16
 INTLVBLOCK   :     32              32
 AELEM        :      0            ----
```

## Environment Variables

The script requires some environment variables to be loaded, i do this in docker using a .env config file:

```
IP=192.168.100.1
USERNAME=admin
PASSWORD=admin
SERVER_PORT=8081
METRICS_PORT=8001
TELNET_CMD=/usr/bin/telnet
SPAWN_TIMEOUT=5
```

## Telnet

The script spawns a telnet connection to the router to gather the stats from the CLI (It could be easily changed to use SSH)

The remote prometheus call to `/metrics`, fires off the telnet request, so this will poll as fast as you want it to.

## Python Modules

[Python Expect](https://pexpect.readthedocs.io/en/stable/) (to gather the stats)
[Template Text Parser](https://ttp.readthedocs.io/en/latest/) (to parse the stats)
[Prometheus Python Client](https://github.com/prometheus/client_python) (to make them available to Prometheus)

## Prometheus

Set as a target as normal.

```
- job_name: router_stats
  honor_timestamps: true
  scrape_interval: 5m
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: http
  static_configs:
  - targets:
    - 192.168.0.1:8003
```

## Dockerfile and Script

`dockerfile`

```dockerfile
FROM python:3-slim

RUN set -eux; \
    useradd -ms /bin/bash puser; \
    pip install prometheus_client pexpect ttp; \
    apt update; \
    apt-get install -y --no-install-recommends \
        curl \
        telnet \
        && rm -rf /var/lib/apt/lists/* ; \
    echo "Done"

# run as non-root user - safety first!
USER puser
WORKDIR /home/puser

# copy code into image
COPY . /home/puser/

# fix for https://github.com/dmulyalin/ttp/issues/54
ENV TTPCACHEFOLDER=/tmp
ENV IP="192.168.200.1"
ENV USERNAME="admin"
ENV PASSWORD="admin"

ENV SERVER_PORT=8081
ENV METRICS_PORT=8001

# where does telnet live?
ENV TELNET_CMD='/usr/bin/telnet' 
# timeout to telnet to router and grab stats
ENV SPAWN_TIMEOUT=5

EXPOSE 8081
EXPOSE 8001

# and run the code :)
ENTRYPOINT ["python3"]
CMD ["vigor-to-prom.py"]
```

`vigor-to-prom.py`

```ps
{% include /python/vigor-to-prom.py %}
```

```
https://github.com/mohclips/draytek_router_stats_prometheus
```