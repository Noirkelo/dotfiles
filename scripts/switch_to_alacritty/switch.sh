#!/bin/sh
export DOTFILES="$HOME/.dotfiles"
if [ "$(cat /proc/$(xdotool getwindowfocus getwindowpid)/comm )" != "alacritty" ]
then 

	wid=$(xdotool search --onlyvisible --class "AlacrittyWd")
	wid_no=$(xdotool search --class "AlacrittyWd")
	#echo $wid
	if [ -z "$wid_no" ]
		then
		       ($HOME/.app/alacritty/target/release/alacritty) &
		       sleep 1
		       xdotool search --class "AlacrittyWd" windowactivate %@ windowfocus %@ 
		       #xdotool search --class "AlacrittyWd" behave %@ blur exec $DOTFILES/scripts/switch_to_alacritty/hidden.sh &
		else
		       xdotool search --class "AlacrittyWd" set_desktop_for_window %@ $(xdotool get_desktop)
		       sleep 0.1 
		       xdotool search --class "AlacrittyWd" windowactivate %@ windowfocus %@ 
		       #xdotool search --class "AlacrittyWd" behave %@ blur exec $DOTFILES/scripts/switch_to_alacritty/hidden.sh  &    
	fi
else 
	xdotool search --class "AlacrittyWd" windowminimize %@ 
fi



#find "AlacrittyWd"
#behave window focus

#? find "AlacrittyWd"
#./..... windows:title=""

#alt+space 
#xdotool windowminimize 155189253
#xdotool windowactivate 115343365

