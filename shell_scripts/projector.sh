#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 <secondary> <position-relative-to> <primary>"
}

if [ $# -eq 2 ]; then
  primary=$( xrandr | grep primary | cut -d' ' -f1 )
  [ "$primary" = "$1" ] && primary=$( xrandr | grep -P '(?!.*primary) connected' | cut -d' ' -f1 );
  xrandr --output $primary --primary --auto
  xrandr --output $1 --off
  MONITOR=$primary $SCRIPTS/polybar_start.sh
elif [ $# -eq 3 ]; then
  xrandr --output $3 --primary --auto --output $1 $2 $3 --auto
  MONITOR=${primary=$3} $SCRIPTS/polybar_start.sh
else
  show_usage "Invalid number of arguments"
  exit 1
fi
