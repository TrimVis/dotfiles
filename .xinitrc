#!/usr/bin/env sh

# has to be one of the first autostarts
eval $(ssh-agent)

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -layout de -option "caps:swapescape" -variant us

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec dwm
