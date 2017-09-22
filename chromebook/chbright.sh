#!/usr/bin/bash
#

PREV=$(cat /sys/class/backlight/pwm-backlight.0/brightness)

echo $1 > /sys/class/backlight/pwm-backlight.0/brightness
echo "Brightness Changed: $PREV -> $1"
