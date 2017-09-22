#!/bin/bash

echo  "==> Optimizing Pacman"
y -Scc --noconfirm
sudo pacman-db-upgrade
sudo pacman-optimize
sync
sudo updatedb
echo  "==> Optimizing Firefox"
sh ~/.scripts/datafox
echo  "==> Optimizing Chromium"
sh ~/.scripts/datachrome
echo
