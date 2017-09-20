#!/bin/bash

volume=$( amixer get Master | awk 'NR == 5 {print $6}' );

if [ $volume = "[on]" ]; then
  amixer -q sset Master playback mute
  amixer -q sset Speaker playback mute
  amixer -q sset Headphone playback mute
else
  amixer -q sset Master playback unmute
  amixer -q sset Speaker playback unmute
  amixer -q sset Headphone playback unmute
fi
