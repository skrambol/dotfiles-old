#!/bin/zsh

i3status -c ~/.config/i3/i3status.conf | while :
do
  read line

  if [[ $(cmus-remote -Q | awk 'NR==1{print $2}') == "playing" ]]; then
    artist=$(cmus-remote -Q | grep 'tag artist ' | cut -d ' ' -f3-)
    song=$(cmus-remote -Q | grep 'tag title ' | cut -d ' ' -f3-)
  else
    artist=$( playerctl metadata artist )
    song=$( playerctl metadata title )
  fi

  echo "$artist - $song | $line" || exit 1
done
