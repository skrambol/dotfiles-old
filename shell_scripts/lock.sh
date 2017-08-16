#!/bin/sh
icon_count=$( ls $HOME/Pictures/ | grep -c "lock_icon" )
num=$(( $RANDOM % $icon_count ))
lock_icon="$HOME/Pictures/lock_icon$num.png"
tmp_screen="/tmp/screen.png"

scrot $tmp_screen
convert $tmp_screen -scale 10% -scale 1000% $tmp_screen
[[ -f $lock_icon ]] && convert $tmp_screen $lock_icon -gravity center -composite -matte $tmp_screen
# -font "/home/foxtrot/.local/share/fonts/Hermit-light.otf" -pointsize 30 -fill white -gravity center -annotate +0+350 "SHOW ME WHAT YOU GOT"\
i3lock -u -i $tmp_screen
rm $tmp_screen
