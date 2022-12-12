# ~/.bashrc

# Exit if we're running in a non-interactive shell.
case $- in
	*i*) 
	;;
	*) 
		return
	;;
esac

# Load and kick off the bootstrap
. $HOME/.dotf/bootstrap
dotf_reload

# TODO: Merge this into dotf?
case "$TERM" in
	xterm|screen|rxvt*|*-256color|linux*)	
		ORANGE="$(_powerline_make_color 208)"
		LORANGE="$(_powerline_make_color 209)"
		RESET="$(_powerline_reset)";
	
		# For powerline
		#PS1='\[${ORANGE}\]\u\[${LORANGE}\]@\[${ORANGE}\]\h\[${LORANGE}\] \w\[${RESET}\]\[${ORANGE}\]$(_powerline_make_powerline)\[${LORANGE}\]\$\[${RESET}\] '
		PS1='\[${ORANGE}\]\u\[${LORANGE}\]@\[${ORANGE}\]\h\[${LORANGE}\] \w\[${RESET}\]\[${ORANGE}\]\[${LORANGE}\]\$\[${RESET}\] '
		
		# Xterm titles
		PS1="\[\e]0;\u@\h: \w\a\]$PS1"
	;;
	
	# All other terminals get a fairly basic prompt, without color or powerline
	# this is just to handle unknown terminals
	*)
		PS1='\u@\h \w\$ '
	;;
esac
