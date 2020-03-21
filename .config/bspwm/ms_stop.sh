#!/bin/bash

notify-send "bspwm" "Stopped master/slave tiling mode"
pkill -f ms_start && bspc node @/ -E

