#!/usr/bin/env sh

# has to be one of the first autostarts
eval $(ssh-agent)

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

setxkbmap -layout de -option "caps:swapescape" -variant us

if [ "$(tty)" = "/dev/tty1" ]; then
    ! pgrep -x dwm >/dev/null && dwm
    
    # Keep the X session alive, to allow restarting of dwm
    while `/bin/true`; do
        sleep 1000
    done
fi
