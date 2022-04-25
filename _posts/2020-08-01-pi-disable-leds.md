---
layout: post
title: "Disable LEDs on Raspberry Pi's"
date: 2020-08-01 09:00:00 +0000
categories: pi #Space Separated
tags: pi led ethernet #Space Separated
---
# Disable LEDs on Raspberry Pi

```sh
sudo nano /boot/config.txt
```
## Turn off PWR LED
```sh
dtparam=pwr_led_trigger=none
dtparam=pwr_led_activelow=off
```
## Turn off ACT LED
```sh
dtparam=act_led_trigger=none
dtparam=act_led_activelow=off
```
## Turn off Ethernet ACT LED
`Pi4`
```sh
dtparam=eth_led0=4
```
`Pi3B`
```sh
dtparam=eth_led0=14
```
## Turn off Ethernet LNK LED
`Pi4`
```sh
dtparam=eth_led1=4
```
`Pi3B`
```sh
dtparam=eth_led1=14
```
