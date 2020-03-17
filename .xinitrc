#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -option "caps:swapescape"

exec bspwm
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec bspwm
#[ "$(tty)" = "/dev/tty2" ] && exec startplasma-x11

