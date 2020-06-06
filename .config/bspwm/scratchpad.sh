#!/usr/bin/env bash

STACK="$HOME/.config/scratchpad"
[ -f "$STACK" ] || touch "$STACK"

while getopts asr OPT
do
	case "${OPT}" in
		a) add $(xdotool);;
		s) show ;;
		r) reset;;
		*) echo "Option not recognized";;
	esac
done

add() {
	$1 >> $STACK

}


