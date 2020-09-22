#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -layout de -variant nodeadkeys -option "caps:swapescape"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec dwm

