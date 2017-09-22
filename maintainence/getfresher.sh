#!/bin/bash

echo -e "==> Cleaning Thumbnails"
sudo /bin/rm -rfv ~/.thumbnails/*
sudo /bin/rm -rfv /root/.thumbnails/*
echo "==> Removing Flash Player Cache"
sudo /bin/rm -rfv ~/.adobe/*
sudo /bin/rm -rfv /root/.adobe/*
sudo /bin/rm -rfv ~/.macromedia/*
sudo /bin/rm -rfv /root/.macromedia/*
echo "==> Cleaning Cache"
sudo polipo -x
sudo /bin/rm -rfv /var/cache/polipo/*
sudo /bin/rm -rfv ~/.cache/*
sudo /bin/rm -rfv /root/.cache/*
sudo /bin/rm -rfv ~/.dvdcss/*
echo "==> Cleaning Trash"
sudo /bin/rm -rfv ~/.local/share/Trash/*
sudo /bin/rm -rfv /root/.local/share/Trash/*
sudo /bin/rm -rfv /tmp/*part
sudo /bin/rm -rfv /home/.Trash-0/*
sudo /bin/rm -rfv /media/Winzoz/*.Bin/*
sudo /bin/rm -rfv /media/Winzoz/System*/*
sudo /bin/rm -rfv /media/Data/*.Bin/*
sudo /bin/rm -rfv /media/Data/System*/*
sudo /bin/rm -rfv /media/Riserva/*.Bin/*
sudo /bin/rm -rfv /media/Riserva/System*/*
echo
