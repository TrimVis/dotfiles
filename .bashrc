#!/usr/bin/env bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=1000
HISTFILESIZE=2000

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h:\[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1='[\u@\h \W]\$ '

shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob

[[ -f $HOME/.config/aliasrc ]] && . ~/.config/aliasrc

#####    WORKAROUNDS    #####
# only needed for APRON
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Android Studio & more
export _JAVA_AWT_WM_NONREPARENTING=1

#####     START FISH    #####
ufetch
shopt -q login_shell || exec /usr/bin/fish

#####     KITTY BASH SHELL INTEGRATION    #####
# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

