#!/bin/sh
urxvtc -name "urxvt_mini" -e cmus
i3-msg "scratchpad show"

[ $1 = "--cava" ] && urxvtc -name "urxvt_mini" -e cava || exit
