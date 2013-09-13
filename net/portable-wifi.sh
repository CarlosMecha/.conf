#!/bin/bash
#
# Simple WIFI portable Hotspot.
#

# Configuration file.
CONF="./portable-wifi-hostapd.conf";

# IP Address
IP="192.168.1.1";

# Out interface
OUT_IFACE="wlan0";

# In interface
IN_IFACE="eth0";

# Shutting down.
if [ "$1" == "-r" ]; then {
  killall hostapd;
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

unset CONF;
unset IP;
unset IN_IFACE;
unset OUT_IFACE;

exit 0;
