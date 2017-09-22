#!/bin/bash
# 
# Dzen2 App Launcher script box version by Rasmus Edgar.
# -tw = Width of titlebar, -w = Width of slavewindow,
# -l = length of slavewindow. Remember to adjust -l accordingly when adding 
# apps. ^pa(*) is for text/decoration alignment.
# 
# The getcurpos(x+y) programs are minor hacks of Robert Manea's getcurpos available
# on his website. The only thing that is changed in the source code is the removal of
# one of the "%d" and e.xbutton.*'s.
#
# Menu script starts below.   
#
# Needed Applications:

AP1=" Internet       "
AP2=" FileManager    "
AP3=" Editor         "
AP4=" Sys Utils      "
AP5=" Toys           "
SM1=" Multimedia     "

# Get cursor position:
CURSORPOS=`getcurpos`
`expr index $CURSORPOS x`

XP=${CURSORPOS:0:`expr index "$CURSORPOS" " "`}
YP=${CURSORPOS:`expr index "$CURSORPOS" " "`}
#XP=$(getcurpos | cut -c1-4)
#YP=$(getcurpos | cut -c5-10)

# Decorations for the menu:

DC1=1x17
DC2=3x2
DC3=4x2
DC4=3x1
DC5=123x10
DC6=125x17

# Font:

FONTSIZE=10
FONT="-*-*-r-*-*-$FONTSIZE-*-*-*-*-*-iso8859-1"

# Menu Title

TI="Dzen Menu"

# Colors:

FG1=#1577D3
FG2=#1577D3
FG3=#1577D3
BG1=#0A1535

# Icons:

IC1=~/dzen_bitmaps/xbm8x8/fox.xbm
IC2=~/dzen_bitmaps/xbm8x8/gimp.xbm
IC3=~/dzen_bitmaps/xbm8x8/note.xbm
IC4=~/dzen_bitmaps/xbm8x8/leaf.xbm
IC5=~/dzen_bitmaps/xbm8x8/pcman.xbm
SMI=~/dzen_bitmaps/xbm8x8/arrow.xbm

# Text piped to Dzen2
echo Xcur: $XP
echo Ycur: $YP
if [ $2 -eq "123" ];
then
	IFOPEN=`ps aux`
	if [ `echo "$IFOPEN" | grep "dzen2"` -s ];
	then
		#If it use the button
		if [ $YP -gt $[ 1050 -24 ] ];
		then
			if [ $XP -lt 50 ];
			then
				XP=0
				YP=1049
			fi
		fi

		ROWNUMBER=10
		echo $[ $FONTSIZE * $ROWNUMBER ]
		echo $[ $[ $FONTSIZE * $ROWNUMBER ] + $YP ]
		if [ $[ $[ $FONTSIZE * $ROWNUMBER ] + $YP ] -gt 1050 ];
		then
			YP=$[ $[ 1049 - 24 ] - $[ $FONTSIZE * $[ $ROWNUMBER + 2 ] ] ]
		fi
		(echo "^ro(${DC6})^ib(1)^pa(30)$TI" ;echo -e "^fg(${FG1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${IC1})^p(-100)^fg(${FG1})${AP1} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${IC2})^p(-100)^fg(${FG1})${AP2} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${IC3})^p(-100)^fg(${FG1})${AP3} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${IC4})^p(-100)^fg(${FG1})${AP4} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${IC5})^p(-100)^fg(${FG1})${AP5} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
		\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${BG1}) ~/.awesome/menu.sh $XP^fg(${FG3})^i(${SMI})^p(-100)^fg(${FG1})${SM1} ^pa(117)^r(1x5)^r(1x4)^r(1x3)^r(1x2)^r(1x1)^p(+2)^r(${DC1})\
    		\n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${SMI})^fg(${FG1}) #-------------# ^pa(124)^r(${DC1})\
    		\n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${SMI})^fg(${FG1}) reboot ^pa(124)^r(${DC1})\
    		\n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${SMI})^fg(${FG1}) halt ^pa(124)^r(${DC1})\
		\n^ro(${DC6})^ib(1)^pa(2)ver. 0.1")\
		| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l $ROWNUMBER -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec;button3=exec:killall dzen2')
		#| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 7 -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec;leaveslave=exit;button3=exit')
	else
		killall dzen2
	fi


elif [ "$2" == "Internet" ];
then 
	ROWNUMBER=7

        (echo "^ro(${DC6})^ib(1)^pa(30)Internet" ;echo -e "^fg(${FG1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC1})^fg(${FG1}) firefox-bin ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC2})^fg(${FG1}) pidgin ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC3})^fg(${FG1}) botch ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC4})^fg(${FG1}) rss ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC5})^fg(${FG1}) wget ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${SMI})^fg(${FG1}) ssh ^pa(124)^r(${DC1})\
        \n^ro(${DC6})^ib(1)^pa(2)ver. 0.1")\
        | (dzen2 -y "$YP" -x "$[ $1 + 125]" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l $ROWNUMBER -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec,exec:killall dzen2;button3=exec:killall dzen2;leaveslave=exit')
        #| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 7 -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec;leaveslave=exit;button3=exit')

elif [ "$2" == "FileManager" ];
then 
	ROWNUMBER=5
        (echo "^ro(${DC6})^ib(1)^pa(30)$TI" ;echo -e "^fg(${FG1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC1})^fg(${FG1}) emelfm ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC2})^fg(${FG1}) thunar ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC3})^fg(${FG1}) pcmanfm ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC4})^fg(${FG1}) mc ^pa(124)^r(${DC1})\
        \n^ro(${DC6})^ib(1)^pa(2)ver. 0.1")\
        | (dzen2 -y "$YP" -x "$[ $1 + 125]" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l $ROWNUMBER -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec,exec:killall dzen2;button3=exec:killall dzen2;leaveslave=exit')
        #| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 7 -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec;leaveslave=exit;button3=exit')

elif [ "$2" == "Editor" ];
then 
	ROWNUMBER=7
        (echo "^ro(${DC6})^ib(1)^pa(30)$TI" ;echo -e "^fg(${FG1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC1})^fg(${FG1}) nano ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC2})^fg(${FG1}) tex ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC3})^fg(${FG1}) vim ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC4})^fg(${FG1}) emacs ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${IC5})^fg(${FG1}) oowriter ^pa(124)^r(${DC1})\
        \n^r(${DC1})^r(${DC2})^r(${DC3})^fg(${FG3})^i(${SMI})^fg(${FG1}) abiword ^pa(124)^r(${DC1})\
        \n^ro(${DC6})^ib(1)^pa(2)ver. 0.1")\
        | (dzen2 -y "$YP" -x "$[ $1 + 125]" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l $ROWNUMBER -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec,exec:killall dzen2;button3=exec:killall dzen2;leaveslave=exit')
        #| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 7 -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec;leaveslave=exit;button3=exit')

fi
