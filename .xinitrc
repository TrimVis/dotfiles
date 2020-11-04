#!/usr/bin/env sh

eval $(ssh-agent)
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -layout de -variant nodeadkeys -option "caps:swapescape"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec dwm

