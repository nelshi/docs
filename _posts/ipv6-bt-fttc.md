# Enable IPv6 on PPPoE
```
set interfaces ethernet eth0 pppoe 0 ipv6 enable
set interfaces ethernet eth0 pppoe 0 ipv6 address autoconf
set interfaces ethernet eth0 pppoe 0 ipv6 dup-addr-detect-transmits 1
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd pd 0 prefix-length /56
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd rapid-commit enable
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd prefix-only
```
# Firewall Rules for IPv6
Only allow:
Established Connections
Related Connections
ICMPv6 (Ping)
DHCPv6 (ISP Address Assignment)

```
set firewall ipv6-name WANv6_LOCAL default-action drop
set firewall ipv6-name WANv6_LOCAL description 'Local network traffic'
set firewall ipv6-name WANv6_LOCAL enable-default-log
set firewall ipv6-name WANv6_LOCAL rule 10 action accept
set firewall ipv6-name WANv6_LOCAL rule 10 description 'Allow established/related sessions'
set firewall ipv6-name WANv6_LOCAL rule 10 state established enable
set firewall ipv6-name WANv6_LOCAL rule 10 state related enable
set firewall ipv6-name WANv6_LOCAL rule 20 action drop
set firewall ipv6-name WANv6_LOCAL rule 20 description 'Drop invalid state'
set firewall ipv6-name WANv6_LOCAL rule 20 state invalid enable
set firewall ipv6-name WANv6_LOCAL rule 30 action accept
set firewall ipv6-name WANv6_LOCAL rule 30 description 'Allow IPv6 icmp'
set firewall ipv6-name WANv6_LOCAL rule 30 protocol icmpv6
set firewall ipv6-name WANv6_LOCAL rule 40 action accept
set firewall ipv6-name WANv6_LOCAL rule 40 description 'allow dhcpv6'
set firewall ipv6-name WANv6_LOCAL rule 40 destination port 546
set firewall ipv6-name WANv6_LOCAL rule 40 protocol udp
set firewall ipv6-name WANv6_LOCAL rule 40 source port 547
set firewall ipv6-name WANv6_LOCAL default-action drop
set firewall ipv6-name WANv6_LOCAL description 'WAN inbound traffic to the router'
set firewall ipv6-name WANv6_IN enable-default-log
set firewall ipv6-name WANv6_IN rule 10 action accept
set firewall ipv6-name WANv6_IN rule 10 description 'Allow established/related sessions'
set firewall ipv6-name WANv6_IN rule 10 state established enable
set firewall ipv6-name WANv6_IN rule 10 state related enable
set firewall ipv6-name WANv6_IN rule 20 action drop
set firewall ipv6-name WANv6_IN rule 20 description 'Drop invalid state'
set firewall ipv6-name WANv6_IN rule 20 state invalid enable
set firewall ipv6-name WANv6_IN rule 30 action accept
set firewall ipv6-name WANv6_IN rule 30 description 'Allow IPv6 icmp'
set firewall ipv6-name WANv6_IN rule 30 protocol icmpv6
set firewall ipv6-name WANv6_IN rule 40 action accept
set firewall ipv6-name WANv6_IN rule 40 description 'allow dhcpv6'
set firewall ipv6-name WANv6_IN rule 40 destination port 546
set firewall ipv6-name WANv6_IN rule 40 protocol udp
set firewall ipv6-name WANv6_IN rule 40 source port 547
set interfaces ethernet eth0 pppoe 0 firewall in ipv6-name WANv6_IN
set interfaces ethernet eth0 pppoe 0 firewall in name WAN_IN
set interfaces ethernet eth0 pppoe 0 firewall local ipv6-name WANv6_LOCAL
set interfaces ethernet eth0 pppoe 0 firewall local name WAN_LOCAL
```
# IPv6 SLAAC
Enable IPv6 Stateless Address Auto Configuration on LAN (Switch0)

```
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd pd 0 interface switch0 host-address '::1'
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd pd 0 interface switch0 prefix-id '::1'
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd pd 0 interface switch0 service slaac
```
# Enable IPv6 on LAN (Switch0)

```
set interfaces switch switch0 ipv6 dup-addr-detect-transmits 1
set interfaces switch switch0 ipv6 router-advert cur-hop-limit 64
set interfaces switch switch0 ipv6 router-advert link-mtu 0
set interfaces switch switch0 ipv6 router-advert managed-flag false
set interfaces switch switch0 ipv6 router-advert max-interval 600
set interfaces switch switch0 ipv6 router-advert other-config-flag false
set interfaces switch switch0 ipv6 router-advert prefix '::/64' autonomous-flag true
set interfaces switch switch0 ipv6 router-advert prefix '::/64' on-link-flag true
set interfaces switch switch0 ipv6 router-advert prefix '::/64' valid-lifetime 2592000
set interfaces switch switch0 ipv6 router-advert reachable-time 0
set interfaces switch switch0 ipv6 router-advert retrans-timer 0
set interfaces switch switch0 ipv6 router-advert send-advert true
```
http://test-ipv6.com/

https://grh.am/2018/ipv6-with-bt-infinity-and-an-edgerouter-x/