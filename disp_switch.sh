#!/usr/bin/bash

if [ "x$1" == "x" ]; then
    echo "No configuration specified to switch to."
    echo ""
    echo "1) Only internal LCD screen"
    echo "2) Single external on HDMI or DP"
    echo "3) Triple head setup with internal screen disabled"
    echo ""
    exit 1
fi

if [ "x$1" == "x1" ]; then
    sudo rm /etc/X11/xorg.conf.d
    sudo ln -s /etc/X11/xorg.conf.single /etc/X11/xorg.conf.d
fi

if [ "x$1" == "x2" ]; then
    sudo rm /etc/X11/xorg.conf.d
    sudo ln -s /etc/X11/xorg.conf.hdmi_single /etc/X11/xorg.conf.d
fi

if [ "x$1" == "x3" ]; then
    sudo rm /etc/X11/xorg.conf.d
    sudo ln -s /etc/X11/xorg.conf.triple /etc/X11/xorg.conf.d
fi
