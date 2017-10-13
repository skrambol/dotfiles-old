#!/bin/bash

monitors=($( xrandr | grep ' connected ' | awk '{print $1}' ))
[ ${#monitors[@]} -eq 2 ] && $SCRIPTS/projector.sh $laptop_monitor --right-of ${monitors[@]/$laptop_monitor/}

