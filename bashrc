#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -cFa'

honoka() {
	ssh 192.168.0.14 $*
}

fetchshot() {
	neofetch;
	sleep 1;
	ssc fullscreen;
}

# cd to projects/*
proj() {
	cd ~/Projects/$*
}

PATH="$HOME/bin:${PATH}"

PS1='\u@\h \w\$ '
