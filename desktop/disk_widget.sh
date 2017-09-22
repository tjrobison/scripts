#!/bin/sh
   PID=/home/lepagee/.awesome/awesome_clock.pid
   amazing & #Lunch amazing
   updateClock() {
	# See 'man date' to see the possible replacements for the % fields.
	echo "1 widget_tell mystatusbar2 clock text "   " `date +\"%a, %b %d %I:%M %p\"`" | awesome-client
   }

   # This will prevent this script from running multiple times
#   if [ -f $PID ] ; then
#	kill -0 `cat $PID` 2> /dev/null
 #  if [ $? -ne 0 ] ; then
#       echo "["`date`"] $0 killed bogus lock file ["`cat $PID`"]"
#   else
#       echo "["`date`"] $0 already running ["`cat $PID`"]"
#       exit
#   fi
#   fi
   echo $$ > $PID

   while true; do
	# Disk
        usage=`df /dev/sda3 | grep "[0-9][0-9]%" -o | grep "[0-9][0-9]" -o`
        echo "1 widget_tell mystatusbar2 diskusage_sda3 data disksda3 ${usage}"
        echo "" # an empty line flushes data inside awesome
        usage=`df /mnt/smbsda1 | grep "[0-9][0-9]%" -o | grep "[0-9][0-9]" -o`
        echo "1 widget_tell mystatusbar2 diskusage_smbsda1 data disksmbsda1 ${usage}"
        echo "" # an empty line flushes data inside awesome
        usage=`df /mnt/smbsdb3 | grep "[0-9][0-9]%" -o | grep "[0-9][0-9]" -o`
        echo "1 widget_tell mystatusbar2 diskusage_smbsdb3 data disksmbsdb3 ${usage}"
        echo "" # an empty line flushes data inside awesome

	#Volume
	#echo 0 widget_tell mystatusbar pb_vol data volume_level "`amixer sget Master | grep 'Limits: Playback' | awk '{print $5}' | sed 's/\[//g;s/%\]//g'`"
	echo 1 widget_tell mystatusbar2 pb_vol data volume_level "`amixer sget Master | grep 'Mono: Playback' | awk '{print $4}' | sed 's/\[//g;s/%\]//g'`"       

	#Clock
  	updateClock

	#Temp
	echo "0 widget_tell mystatusbar tempCPU data tempCPUdata ` sensors | grep "Core 0:" | grep -o "[0-9][0-9] C " | grep -o "[0-9][0-9]"`"
	echo ""
	echo "0 widget_tell mystatusbar txtTempCPU text `sensors | grep "Core 0:" | grep -o "[0-9][0-9] C "`"
        echo "" # an empty line flushes data inside awesome  	

        echo "0 widget_tell mystatusbar tempGPU data tempGPUdata `/usr/local/bin/nvclock -i | grep "GPU temp" | grep -o "[0-9][0-9]"`"
        echo ""
        echo "0 widget_tell mystatusbar txtTempGPU text `/usr/local/bin/nvclock -i | grep "GPU temp" | grep -o "[0-9][0-9]"` C"
        echo "" # an empty line flushes data inside awesome

        echo "0 widget_tell mystatusbar tempHDD data tempHDDdata `/usr/sbin/hddtemp /dev/sda | grep "[0-9][0-9] C" -o`"
        echo ""
        echo "0 widget_tell mystatusbar txtTempHDD text `/usr/sbin/hddtemp /dev/sda | grep "[0-9][0-9] C" -o`"
        echo "" # an empty line flushes data inside awesome

	sleep 10;
	#sleep 600;

   done | awesome-client
