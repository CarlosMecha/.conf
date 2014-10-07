#!/bin/bash
#
# Simple WIFI portable Hotspot.
#

# Configuration file.
CONF="./portable-wifi-hostapd.conf";
DHCP_CONF="./portable-wifi-dhcp.conf";

# IP Address
IP="10.0.0.1";

# Out interface
OUT_IFACE="wlan0";

# In interface
IN_IFACE="eth0";

# Shutting down.
if [ "$1" == "-r" ]; then {
  killall hostapd;
  killall dhcpd;
  iwconfig $OUT_IFACE mode Managed;
  echo "0" > /proc/sys/net/ipv4/ip_forward;
  iptables -t nat -D POSTROUTING -o $IN_IFACE -j MASQUERADE;
  exit 0;
} fi;

iwconfig $OUT_IFACE mode Master;
ifconfig $OUT_IFACE $IP;
echo "1" > /proc/sys/net/ipv4/ip_forward;
iptables -t nat -A POSTROUTING -o $IN_IFACE -j MASQUERADE;
nohup hostapd $CONF 2>&1 >> /dev/null &
dhcpd -cf $DHCP_CONF 2>&1 >> /dev/null

unset CONF;
unset DHCP_CONF;
unset IP;
unset IN_IFACE;
unset OUT_IFACE;

exit 0;
