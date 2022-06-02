#!/bin/bash
# Usage: ddc-daylight night
case "$1" in
   "day" )
      BRIGHTNESS=100
      TEMPERATURE=0x09
      ;;
   "evening" | "morning" )
      BRIGHTNESS=60
      TEMPERATURE=0x06
      ;;
   "night" )
      BRIGHTNESS=30
      TEMPERATURE=0x04
      ;;
   "dark" )
      BRIGHTNESS=0
      TEMPERATURE=0x04
      ;;
   * )
      echo "Unknown time of day '$1'"
      exit 1
      ;;
esac

ddcutil --bus=5 setvcp 10 $BRIGHTNESS &
ddcutil --bus=6 setvcp 10 $BRIGHTNESS &
wait

