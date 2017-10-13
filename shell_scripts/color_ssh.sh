#!/bin/bash

trap $SCRIPTS/colorterm.sh INT EXIT TERM

$SCRIPTS/colorterm.sh 233

ssh $*
