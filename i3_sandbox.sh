#!/bin/sh
Xephyr -ac -br -noreset -screen 1260x690 :1 &
sleep 1

DISPLAY=:1.0 i3

#if [ "x$1" != "x" ]; then
#    DISPLAY=:1.0 awesome -c $1
#
#elif [ -e /home/tj/.dotfiles/awesomerrc.lua ]; then
#    DISPLAY=:1.0 awesome -c /home/tj/.dotfiles/awesomerc/rc.lua
#
#else
#    DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua
#
#fi

