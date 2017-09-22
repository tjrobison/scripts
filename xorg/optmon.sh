x=1920
y=1080

modeline=`cvt $x $y | sed "1d" | sed 's/Modeline //'`
mode=`echo $modeline | sed 's/ .*//'`

xrandr --newmode $modeline &> /dev/null 2>&1
xrandr --addmode VIRTUAL $mode
xrandr --output VGA1 --auto --output VIRTUAL1 --mode $mode --left-of VGA1
optirun screenclone -s  -d :8 -x 1
xrandr --output VIRTUAL --off
