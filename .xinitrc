#!/usr/bin/env sh

# has to be one of the first autostarts
eval $(ssh-agent)
setxkbmap -layout de -option "caps:swapescape" -variant us 
# setxkbmap -layout de -variant us
# setxkbmap -layout de -option "caps:ctrl_modifier" -variant us
# xcape -e 'Control_L=Escape' -t 200

# Not sure if this is necessary, but start the keyring
dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets


# set pywal theme
# favorites: sexy-dotshare (-a 1), 3024, solarized
wal --theme solarized -n -b "#02111b"

if [ "$(tty)" = "/dev/tty1" ]; then
    [ -f "$HOME/.xprofile" ] && . ~/.xprofile
    while true; do
        ! pgrep -x dwm >/dev/null && dwm
    done;
fi
if [ "$(tty)" = "/dev/tty2" ]; then
    [ -f "$HOME/.xprofile" ] && . ~/.xprofile
    ! pgrep -x dwm >/dev/ull && dwm
fi
