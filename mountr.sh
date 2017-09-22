#!/bin/sh

if [ "x$1" == "x-a" ]; then
    sudo systemctl start thunar.service &
    ( sleep 4 && urxvt -e ranger /media ) &

elif [ "x$1" == "x-d"]; then
    sudo mkdir /media/Disk
    sudo pmount /dev/sr0 /media/Disk
    urxvt -e ranger /media/Disk

elif [ "x$1" == "x-u"]; then
    sudo mkdir /media/Usb
    pmount /dev/sdb1 /media/Usb
    urxvt -e ranger /media/Usb

else
    echo "Usage was not specified"
    echo "-a  starts mount management daemon and opens in filemanager"
    echo "-u  mounts dist and opens in file manager"
    echo "-u  mounts usb media and opens in file manager"
fi
