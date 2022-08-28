#!/usr/bin/env sh

# has to be one of the first autostarts
eval $(ssh-agent)
setxkbmap -layout de -option "caps:swapescape" -variant us

if [ "$(tty)" = "/dev/tty1" ]; then
    [ -f "$HOME/.xprofile" ] && . ~/.xprofile
    ! pgrep -x dwm >/dev/null && dwm
    
    # Keep the X session alive, to allow restarting of dwm
    while `/bin/true`; do
        sleep 1000
    done
fi
if [ "$(tty)" = "/dev/tty2" ]; then
    ! pgrep -x leftwm >/dev/null && exec leftwm
fi
