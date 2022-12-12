#!/bin/bash

# NOT really PowerLine
# TODO For notpl: re-enable
# and allow showing env name if set

_powerline_make_color() {
	echo "$(tput setaf $1)"
}

_powerline_reset() {
	echo "$(tput sgr0)"
}

# shows return code of last executed item if it's not 0
_powerline_return_code() {
	local return_code=$?
	if [ "$return_code" != "0" ]; then
		echo " $(_powerline_make_color 196)($return_code)$(_powerline_reset)"
	fi
}	

# TODO: probably cache
_powerline_git() {
	local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	local has_anything="n"
	
    if [ -n "$git_branch" ]; then
		has_anything="y";
		echo -n "$(_powerline_make_color 208) ($git_branch"
	fi
	
	
	if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
		echo -n " D"
	fi
	
	# Detached HEAD state.
	if [ "$git_branch" == "HEAD" ]; then
		echo -n ' d';
	fi
	
	if [ "$has_anything" == "y" ]; then
		echo -n ")"
	fi
}

# make the powerline from any of the above powerline functions
_powerline_make_powerline() {
	echo "$(_powerline_return_code)$(_powerline_git)"
}
