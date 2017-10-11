#!/bin/bash

xrdb -merge ${1-"$HOME/.Xresources"}
