#!/bin/bash

if [ "x$1" = "x-install"]; then
    cd $HOME &&  wget http://archlinuxarm.org/os/ArchLinuxARM-imx6-latest.tar.gz
    cd /usr/local
    sudo mkdir arch
    sudo chown chronos.chronos arch
    cd arch
    tar xzvf $HOME/ArchLinuxARM-imx6-latest.tar.gz
    exit

else
    cp /etc/resolv.conf /usr/local/arch/etc/resolve.conf

    sudo mount -o bind /dev /usr/local/arch/dev
    sudo mount -t devpts none /usr/local/arch/dev/pts
    sudo mount -t proc proc /usr/local/arch/proc
    sudo mount -t sysfs sys /usr/local/arch/sys

    sudo chroot /usr/local/arch /bin/bash

    sudo umount /usr/local/arch/dev/pts
    sudo umount /usr/local/arch/dev/
    sudo umount /usr/local/arch/proc
    sudo umount /usr/local/arch/sys
fi
