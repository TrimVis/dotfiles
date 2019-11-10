#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -option "caps:swapescape"

exec i3
