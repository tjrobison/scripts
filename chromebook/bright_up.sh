#!/bin/sh
#
# Script to lower brightness in Samsung ARM Chromebook
#
# Needs to have write permissions in 
# /sys/class/backlight/pwm-brightness.0/brightness
#
# April 2013

BRIGHT_INCREMENT=10
MAX_BRIGHT=255

read CURRENT_BRIGHT < /sys/class/backlight/pwm-backlight.0/brightness

NEW_BRIGHT=`expr $CURRENT_BRIGHT + $BRIGHT_INCREMENT`

if [ $NEW_BRIGHT -le $MAX_BRIGHT ]
then
    echo $NEW_BRIGHT > /sys/class/backlight/pwm-backlight.0/brightness
    #set $NEW_BRIGHT
fi

