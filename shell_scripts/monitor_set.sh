#!/bin/bash

monitors=($( xrandr --listactivemonitors | awk 'NR!=1{gsub(/[*+]/, ""); print $2}' ))
[ ${#monitors[@]} -eq 2 ] && source $SCRIPTS/projector.sh $laptop_monitor --right-of ${monitors[@]/$laptop_monitor/}

