#!/bin/sh
urxvtc -name "urxvt_mini" -e cmus

[ $1 = "--cava" ] && urxvtc -name "urxvt_mini" -e cava || exit
