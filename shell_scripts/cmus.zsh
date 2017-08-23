#!/bin/zsh

artist=$(cmus-remote -Q | grep 'tag artist ' | cut -d ' ' -f3-)
song=$(cmus-remote -Q | grep 'tag title ' | cut -d ' ' -f3-)

  output="$artist - $song"
[[ $(cmus-remote -Q | awk 'NR==1{print $2}') == "paused" ]] && output="$output (paused)"

echo $output
