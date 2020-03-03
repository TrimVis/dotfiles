#!/bin/bash

notify-send "bspwm" "Started master/slave tiling mode"
bspc subscribe node_{remove,add} | while read _; do $HOME/.config/bspwm/master_slave.sh; done

