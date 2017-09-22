#!/bin/sh

Xephyr -ac -br -noreset -screen 1280x800 :4.0 &
sleep 2
DISPLAY=:4.0 awesome -c "$1"
