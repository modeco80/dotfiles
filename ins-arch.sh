#!/bin/bash

# install all the needed packages on arch
# (and copy over a user-specific xinitrc)

PACKAGES=(
 	xorg-server
	xorg-xinit
	lxterminal
	i3-gaps
	pulseaudio
	firefox
	dmenu	# i3 marks as optional but I use $mod+d so much
		# that i can't live without dmenu
);

pacman -S ${PACKAGES[*]};
cp -v arch/xinitrc ~/.xinitrc;
