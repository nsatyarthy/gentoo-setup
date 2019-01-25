#!/usr/bin/env

echo "Will now try to connect to WiFi"

modeprobe -rf mwifiex_pcie
modeprobe -if mwifiex_pcie
wpa_supplicant -B -c/etc/wpa_supplicant/wpa_supplicant.conf -iwlp1s0
dhcpcd wlp1s0
ping -c 4 www.google.com
