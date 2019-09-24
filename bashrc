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

unzip() {
	bsdtar xvf $1
}

wget() {
	curl -LO $1
}

PATH="$HOME/bin:${PATH}"

PS1='\u@\h \w\$ '
