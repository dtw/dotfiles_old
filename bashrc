source /etc/bash.colors

if [ -n "$SSH_CLIENT" ]; then
	PS1="[@\[$IGreen\]\h\[$Color_Off\] \[$ICyan\]\W\[$Color_Off\]] $ "
else
	PS1="[\[$ICyan\]\W\[$Color_Off\]] $ "
fi

# Set up the LS_COLORS and LS_OPTIONS environment variables for color ls:
if [ "$SHELL" = "/bin/zsh" ]; then
 eval `dircolors -z`
elif [ "$SHELL" = "/bin/ash" ]; then
 eval `dircolors -s`
else
 eval `dircolors -b`
fi

alias spacman="sudo pacman"
alias ls="ls --color"
alias X="startx -- $@"
alias wget="wget -t 2 --passive-ftp"
alias ncmpc="ncmpc -e -h kenpachi"
alias tmux="tmux attach -d || tmux new"

MANPATH=$MANPATH
PATH=$HOME/bin:$PATH

export OOO_FORCE_DESKTOP="gnome &"
export VDPAU_DRIVER=va_gl
export EDITOR="vim"
export QT_XFT=true

# bash history stuff
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=5000                   # big big history
export HISTFILESIZE=5000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save the history after each command finishes
#export PROMPT_COMMAND="history -a\; $PROMPT_COMMAND"
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history/$(date "+%Y-%m-%d").log; fi'
complete -cf sudo
complete -cf man
