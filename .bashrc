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

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob

[[ -f $HOME/.config/aliasrc ]] && . ~/.config/aliasrc

ufetch

# This is needed for APRON only
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# This is needed for Android Studio to work properly
export _JAVA_AWT_WM_NONREPARENTING=1



shopt -q login_shell || exec /usr/bin/fish
