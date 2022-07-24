#!/bin/bash

brightnessctl set 100%

nbMon=$(xrandr | grep -oc ' connected')
for i in $(xrandr | grep ' connect' | awk '{print $1}')
do
	if [[ $i ==  "eDP-1" && $nbMon == "3" ]]
	then
		xrandr --output eDP-1 --pos 2400x1152 --primary
	else
	if [ $i == "HDMI-1" ]
	then
		xrandr --output HDMI-1 --pos 1200x0 --left-of eDP-1 --rotate right
	else
	if [ $i == "DP-1" ]
	then
		xrandr --output DP-1 --pos 0x0 --left-of HDMI-1 --rotate left
	fi
	fi
	fi
done

feh --bg-fill --randomize ~/Images/Wallpapers/*
eval "set -- $(sed 1d "$HOME/.fehbg")"
~/.config/polybar/forest/scripts/pywal.sh $4
~/.config/polybar/forest/launch.sh --forest &

while sleep 1800
do
	feh --bg-fill --randomize ~/Images/Wallpapers/*
	eval "set -- $(sed 1d "$HOME/.fehbg")"
	~/.config/polybar/forest/scripts/pywal.sh $4
	~/.config/polybar/forest/launch.sh --forest &
done
