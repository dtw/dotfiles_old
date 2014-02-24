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

MANPATH=$MANPATH
PATH=$HOME/bin:$PATH

export OOO_FORCE_DESKTOP="gnome &"
export VDPAU_DRIVER=va_gl
export EDITOR="vim"
export QT_XFT=true

complete -cf sudo
complete -cf man
