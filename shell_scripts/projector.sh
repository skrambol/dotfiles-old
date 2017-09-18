#!/bin/sh

[[ $# -eq 2 ]] && xrandr --output $1 --off
[[ $# -eq 3 ]] && xrandr --output $3 --primary --auto --output $1 $2 $3 --auto
