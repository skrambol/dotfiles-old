#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 <secondary> <position-relative-to> <primary>"
}

if [ $# -eq 2 ]; then
  xrandr --output $1 --off
elif [ $# -eq 3 ]; then
  xrandr --output $3 --primary --auto --output $1 $2 $3 --auto
else
  show_usage "Invalid number of arguments"
  exit 1
fi
