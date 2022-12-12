#!/bin/bash

# General aliases.

eval "$(dircolors -b)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

perftoggle() {
	if [ "$PERF_MODE" == "on" ]; then
		export PERF_MODE="off"
		for i in $(seq 0 $(($(nproc)-1))); do
			echo powersave | sudo tee /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor > /dev/null
		done
	else
		export PERF_MODE="on"
		for i in $(seq 0 $(($(nproc)-1))); do
			echo performance | sudo tee /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor > /dev/null;
		done
	fi
	
	
	echo "performance mode $PERF_MODE"
}

# spawn a clean environment ready for experimentation
spawnenv() {
	echo "NOTE: To exit back to *this* \"dirty\" shell, "
	echo "run \"exit\" in the newly spawned shell."
	env -i HOME=$HOME TERM=$TERM bash
}
