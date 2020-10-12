################################################################################
#
# Bash configuration for interactive shells.
#
# ~/.bashrc
#
# More info: https://www.librobert.net/book/internet
#
################################################################################
#
# Copyright (c) 2019 Robert LA LAU < https://www.librobert.net/ >
#
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/
# or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
################################################################################
#
# Save this file as .bashrc in each user's home directory (including root)
# or merge them, if a file of that name already exists.
#
# Also save this file as /usr/share/skel/dot.bashrc (FreeBSD)
# or /etc/skel/.bashrc (Linux), or merge them.
#
# See bash(1) for documentation.
#
################################################################################

# Do nothing if this is not an interactive shell.
[ -z "${-//[^i]/}" ] && return

# This makes the shell a bit more user friendly.
shopt -s histappend checkwinsize
export FIGNORE='.bak:~'
export HISTCONTROL=ignoreboth
export LC_COLLATE=C

# It's practical to have a personal directory for scripts.
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

# The default application for reading text files.
if [ -x `which less`]; then
	export PAGER=less
else 
	export PAGER=more
fi

# The default application for editing text files.
if [ -x `which nano` ]; then
	export EDITOR=nano
else
	export EDITOR=vi
fi

# Command aliases.
alias ll='ls -lF'
alias lsl='ls -laF'
alias lsc='ls -1 | wc -l | sed -e "s/[[:blank:]]//g"'
alias lsca='ls -A1 | wc -l | sed -e "s/[[:blank:]]//g"'
#alias ls='ls -F'

# Change the prompt, and the title for X terminals.
# See also: https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
if [ "${PS1}" ]; then

	# User, hostname and path in the title bar.
	case ${TERM} in
		xterm*|rxvt*|Eterm|eterm)
			PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
			;;
		screen)
			PROMPT_COMMAND='echo -ne "\033_(screen)${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
			;;
		*)
			;;
	esac

	# User, hostname and path in the prompt; colored name for root user.
	if [ "`id -u`" = "0" ]; then
		PS1='\[\033[41m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\w # '
	else
		PS1='\u@\h:\w $ '
	fi
fi

# Example function.
# After this file has been loaded, type 'example 1 two ...' (without the quotes) on the command line.
example() {
	first=$1
	shift
	rest=$@
	echo "First argument was '${first}'."
	echo "The rest of the arguments was '${rest}'."
}
