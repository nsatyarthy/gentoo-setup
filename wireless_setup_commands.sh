# this config is for Microsoft Surface Pro
# log in as root

# query the kernel for loaded modules and drivers
lspci -k

# ensure that the appropriate kernel module is loaded
modprobe -rf mwifiex_pcie
modprobe -if mwifiex_pcie

# determine the wireless interface name
ifconfig -a
# for the remainder of this text, it is assumed that
# the interface is named wlp1s0

# ensure wpa_supplicant is not running
killall wpa_supplicant

# create /etc/wpa_supplicant/wpa_supplicant.conf with following content: 
#
#         ctrl_interface=/var/run/wpa_supplicant
#         ctrl_interface_group=0
#         ap_scan=1
#
#         network={
#             ssid="<ssid>"
#             scan_ssid=1
#             key_mgmt=WPA-PSK
#             psk="<password>"
#         }

# run wpa_supplicant
wpa_supplicant -B -c/etc/wpa_supplicant/wpa_supplicant.conf -iwlp1s0

# assign IP address
dhcpcd wlp1s0
