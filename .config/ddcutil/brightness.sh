#!/bin/bash

Help()
{
   # Display Help
   echo "This script sets the brightness of all connected monitors"
   echo
   echo "Syntax: monitor_brightness [-h] brightness"
   echo "options:"
   echo "h     Print this Help."
   echo
}


while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

brightness=$1
brightness_c="0x10"

if [ -z "$brightness" ]
then 
    echo "Error. No brightness specified"
    exit 1
fi

# Detect all monitor serial numbers
monitor_serials=`ddcutil detect --terse | grep Monitor: | sed -e 's/.*:.*:.*://'`

for serial_num in $monitor_serials;do 
    ddcutil --sn $serial_num setvcp ${brightness_c} ${brightness}
done
