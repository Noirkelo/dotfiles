#!/bin/sh 
#$1
PPID=$(xdotool getwindowfocus getwindowpid)
if [ "$(cat /proc/$ppid/comm )" != "alacritty" ]
then 
	xdotool search --class "AlacrittyWd" windowminimize %@
	kill $PPID
fi

