#!/bin/bash

[ -z $TMUX ] && echo "no tmux server found" 2>&1 && exit 1

default="default"
white=231
black=16
color="bg=colour"

case ${1-$default} in
  "default" | "reset") color="bg=$default" ;;
  "black") color=$color$black ;;
  "white") color=$color$white ;;
  *) color=$color$1;;
esac

if echo $TERM | grep -q "tmux" && [ -n "$TMUX" ]; then
  tmux select-pane -P "$color"
fi
