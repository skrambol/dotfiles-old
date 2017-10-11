#!/bin/bash
monitor_count=$( xrandr --listactivemonitors | head -n1 | cut -d' ' -f2 )
icon_count=$( ls $HOME/Pictures/ | grep -c "lock_icon" )
num=$(($RANDOM%$icon_count))
lock_icon="$HOME/Pictures/lock_icon$num.png"
tmp_lock_icon=/tmp/$(basename $lock_icon)
tmp_screen="/tmp/screen.png"

stop_music() {
  cmus-remote -u 2> /dev/null
  playerctl pause 2> /dev/null
}

if [ $monitor_count -eq 1 ]; then
  scrot $tmp_screen
  convert $tmp_screen -scale 10% -scale 1000% $tmp_screen
  [ -f $tmp_lock_icon ] || convert $lock_icon -scale 550 $tmp_lock_icon
  [ -f $tmp_lock_icon ] && convert $tmp_screen $tmp_lock_icon -gravity center -composite -matte $tmp_screen
  # -font "/home/foxtrot/.local/share/fonts/Hermit-light.otf" -pointsize 30 -fill white -gravity center -annotate +0+350 "SHOW ME WHAT YOU GOT"\
  [ "$1" != "--no-pause" ] && stop_music
  i3lock -u -i $tmp_screen
  rm $tmp_screen
else
  i3lock -u -p win -c 000000
fi

#
# main idea from https://github.com/savoca/dotfiles/blob/gray/home/.bin/scripts/lock.sh
#
