#!/bin/sh

# Disable DPMS turning off the screen
xset -dpms
xset s off

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp

# Enforce correct locales from the beginning:
unset LC_ALL
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

export ENV=$HOME/.kshrc

# Set background color
xsetroot -solid black

# Enable core dumps in case something goes wrong
#ulimit -c unlimited

if [ -f ~/.Xresources ]; then
    xrdb -load ~/.Xresources
fi

# make the keyboard input more snappy
xset r rate 250 60

# enable scrolling with trackpoint and middle button
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

exec i3

