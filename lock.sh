#!/bin/bash
lock_icon="$HOME/Pictures/lock_icon.png"
tmp_screen="/tmp/screen.png"

scrot $tmp_screen
convert $tmp_screen -scale 10% -scale 1000% $tmp_screen
[[ -f $lock_icon ]] && convert $tmp_screen $lock_icon -gravity center -composite -matte $tmp_screen
i3lock -u -i $tmp_screen
rm $tmp_screen
