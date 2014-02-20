source /etc/bash.colors

if [ -n "$SSH_CLIENT" ]; then
	PS1="[@\[$IGreen\]\h\[$Color_Off\] \[$ICyan\]\W\[$Color_Off\]] $ "
	#PS1="[\[\033[1;36m\]\u@\h\[\033[0;37m\]]: " 
else
	PS1="[\[$ICyan\]\W\[$Color_Off\]] $ "
	#PS1="[\[\033[1;36m\]\W\[\033[0;37m\]]: " 
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
#alias urxvt="urxvt -ip +sb +rv -sl 5000 -title [dib:box] -sh 75 -tint grey -fn "xft:terminus-12""
#alias urxvt="urxvt -ip +sb -rv -sl 5000 -title [dib:box] -sh 75 -tint grey"
#alias X="startx -- -dpi 96 -nolisten tcp $@"
alias X="startx -- $@"
alias wget="wget -t 2 --passive-ftp"
alias ncmpc="ncmpc -e -h kenpachi"

MANPATH=$MANPATH
PATH=$HOME/bin:$PATH

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export OOO_FORCE_DESKTOP="gnome &"

# AUR cvs
#export CVSROOT=":pserver:dtw@cvs.archlinux.org:/home/cvs-community"
export CVS_RSH=ssh
export EDITOR="vim"
export QT_XFT=true

complete -cf sudo
complete -cf man
