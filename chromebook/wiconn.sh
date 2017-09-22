#!/usr/bin/bash
#
# Uses wpa supplicant to connect to all preconfigured APs
#

CONFIG="/etc/wpa_supplicant/cornell.conf"
DEV="wlp13s0"

if [ "x$1" == "xadd" ]; then
    if [ $# -eq 3 ]; then
        ENTRY=`wpa_passphrase $2 $3`
        sudo echo $ENTRY >> $CONFIG
        echo "Network $1 added to configuration."
    elif [ $# -eq 2 ]; then
        sudo echo '' >> $CONFIG
        sudo echo 'network={' >> $CONFIG
        sudo echo "  ssid=\"$2\"" >> $CONFIG
        sudo echo '  key_mgmt=NONE' >> $CONFIG
        sudo echo '}' >> $CONFIG

        echo "Network $2 added to configuration."

    else
        echo "No network was specified. Exiting."
    fi

else
    [ "x$1" == "xr" ] && sudo killall wpa_supplicant dhcpcd
    echo "Connecting to network..."
    sudo wpa_supplicant -B -i $DEV -c $CONFIG && sleep 1s
    echo "Success! Acquiring ip lease..."
    sudo dhcpcd -A $DEV
    echo "Done!"
fi
