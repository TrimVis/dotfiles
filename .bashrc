#!/usr/bin/env bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE= HISTFILESIZE= # Infinite history.

# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# export PS2='asdf'
rightprompt()
{
		printf "%*s" $COLUMNS "[\$?]"
}

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1="\[$(tput sc; tput bold; tput setaf 2; rightprompt; tput rc)\] \[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1='\[$(tput sc; rightprompt; tput rc)\]left prompt > '

#PS1='\[\033[38;5;196m\]\u\[\033[38;5;210m\]@\[\033[38;5;214m\]\h\[\033[38;5;210m\]: \[\033[38;5;080m\]\W \[\033[38;5;210m\]\$ \[\033[0m\]'
#PS1='[\u@\h \W]\$ '

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob

[[ -f $HOME/.config/aliasrc ]] && . ~/.config/aliasrc

#enable vi mode
set -o vi

source /opt/oh-my-git/prompt.sh
ufetch-arco
