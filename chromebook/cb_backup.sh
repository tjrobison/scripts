#!/usr/bin/bash

OUTDIR="/mnt/tyrese/backup/blinky"

echo "archiving etc..." &&
sudo tar -cjf "$OUTDIR/etc.tar.bz2" "/mnt/sd/etc" &&
echo "etc archived successfully!" &&

echo "archiving home..." &&
sudo tar -cjf "$OUTDIR/home.tar.bz2" "/mnt/sd/home/tj" &&
echo "home archived successfully!" &&

echo "archiving var..." &&
sudo tar -cjf "$OUTDIR/var.tar.bz2" "/mnt/sd/var" &&
echo "var archived successfully!"
