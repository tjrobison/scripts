#!/bin/sh
#
# Script to lower brightness in Samsung ARM Chromebook
#
# Needs to have write permissions in 
# /sys/class/backlight/pwm-backlight.0/brightness
#
# April 2013

BRIGHT_INCREMENT=10
MIN_BRIGHT=0

read CURRENT_BRIGHT < /sys/class/backlight/pwm-backlight.0/brightness

NEW_BRIGHT=`expr $CURRENT_BRIGHT - $BRIGHT_INCREMENT`

if [ $NEW_BRIGHT -ge $MIN_BRIGHT ]
then
    echo $NEW_BRIGHT > /sys/class/backlight/pwm-backlight.0/brightness
    #export $NEW_BRIGHT
fi
