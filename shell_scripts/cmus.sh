#!/bin/bash

artist=$(cmus-remote -Q | grep '^tag artist ' | cut -d ' ' -f3-)
song=$(cmus-remote -Q | grep '^tag title ' | cut -d ' ' -f3-)

if [ -z "$artist" ] || [ -z "$song" ]; then
  output=$(basename -s .mp3 "$(cmus-remote -Q | grep '^file ' | cut -d ' ' -f2-)")
else
  output="$artist - $song"
fi

cmus_status=$(cmus-remote -Q | awk 'NR==1{print $2}')

[ "$cmus_status" = "paused" ] || [ "$cmus_status" = "stopped" ] && output="%{F#555555}$output"

echo $output
