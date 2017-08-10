#!/bin/sh

i3status -c ~/.config/i3/i3status.conf | while :
do
  read line
  #artist=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
  #song=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
  artist=$( playerctl metadata artist )
  song=$( playerctl metadata title )
  echo "$artist - $song | $line" || exit 1
done
