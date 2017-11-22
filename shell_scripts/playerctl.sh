#!/bin/bash

artist=$(playerctl metadata artist)
song=$(playerctl metadata title)
status=$(playerctl status)

output="$artist - $song"

[ "$status" = "Paused" ] || [ "$status" = "Stopped" ] && output="%{F#555555}$output"

echo $output
