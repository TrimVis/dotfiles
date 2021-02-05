#!/usr/bin/env sh
#
# Profile file. Runs on login.
#

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="pcmanfm"
export VIDEO="mpv"
#export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"

# Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
#export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export IPYTHONDIR="$HOME/.config/ipython"
export JUPYTER_CONFIG_DIR="$HOME/.config/jupyter"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export UNISON="$XDG_CONFIG_HOME/unison"
export DOTBARE_DIR="$HOME/.config/git-dots"
export DOTBARE_TREE="$HOME"
export SPACEVIMDIR="$XDG_CONFIG_HOME/spacevim/"
# proper qt themes
export QT_QPA_PLATFORMTHEME="qt5ct"

# Java things
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export JUNIT_HOME="$HOME/.local/share/JUnit"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.13.1.jar"


# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx
