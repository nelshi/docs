---
layout: post
title: "Disable LEDs on Raspberry Pi's"
date: 2020-08-01 09:00:00 +0000
categories: pi #Space Separated
tags: pi led ethernet #Space Separated
---
# Disable LEDs on Raspberry Pi

```
sudo nano /boot/config.txt
```
#### Turn off PWR LED
```
dtparam=pwr_led_trigger=none
dtparam=pwr_led_activelow=off
```
#### Turn off ACT LED
```
dtparam=act_led_trigger=none
dtparam=act_led_activelow=off
```
#### Turn off Ethernet ACT LED
```
dtparam=eth_led0=4
dtparam=eth_led0=14 | Pi3B
```
#### Turn off Ethernet LNK LED
```
dtparam=eth_led1=4
dtparam=eth_led1=14 | Pi3B
```
