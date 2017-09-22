#!/usr/bin/bash
#
# Uses wpa supplicant to connect to all preconfigured APs
#

CONFIG="/etc/wpa_supplicant/wpa_supplicant.conf"

if [ "x$1" == "xe" ]; then
    vim $CONFIG

else
    [ "x$1" == "xr" ] && sudo killall wpa_supplicant dhcpcd
    echo "Connecting to network..."
    sudo wpa_supplicant -B -i wlp13s0 -c $CONFIG && sleep 1s
    echo "Success! Acquiring ip lease..."
    sudo dhcpcd -A wlp13s0
    echo "Done!"
fi
