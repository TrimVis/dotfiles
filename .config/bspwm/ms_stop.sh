#!/bin/bash

notify-send "bspwm" "Stopped master/slave tiling mode"
pkill -f ms_tiling_mode_start && bspc node @/ -E

