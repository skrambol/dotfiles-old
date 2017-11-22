#!/bin/bash

if [ $# -eq 1 ]; then
  xrdb -merge $1
else
  xrdb -I$CONFIG/x -merge "$HOME/.Xresources"
fi
