#!/bin/bash
stop_music() {
  cmus-remote -u 2> /dev/null
  playerctl pause 2> /dev/null
}

[ "$1" != "--no-pause" ] && stop_music
i3lock -c '#000000' -p win -l '#ffffff' -w '#ffffff' -o '#ffffff' -e
