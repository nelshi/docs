---
layout: post
title: "Static Host Mappings on Edgerouter"
date: 2021-12-10 09:00:00 +0000
categories: edgerouter #Space Separated
tags: edgerouter dns static hostname #Space Separated
---
# Static Host Mappings on EdgeRouter-X

```
$ configure
# show system static-host-mapping
# exit
```

To add a static host mapping and an alias:

```
$ configure
# set system static-host-mapping host-name pi.hole inet 192.168.1.8
# set system static-host-mapping host-name pi.hole alias pihole
# commit
# save
# exit
```

To remove static mapping and all aliases:

```
$ configure
# delete system static-host-mapping host-name pi.hole
# commit
# save
# exit
```