#!/bin/bash - 
#===============================================================================
#
#          FILE: createlinks.sh
# 
#         USAGE: ./createlinks.sh 
# 
#   DESCRIPTION: symlinks files to ~ from dotfiles 
# 
#       OPTIONS: N/A
#  REQUIREMENTS: find
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Phil Thiselton(dibble@thwerecker.net), 
#  ORGANIZATION: 
#       CREATED: 19/02/14 16:00
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/.dotfiles_$(date +%Y%m%d) # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
files=$(find $dir -maxdepth 1 -mindepth 1 ! -name *.sh) # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in $HOME"
[[ ! -d $olddir ]]  && mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  if [[ -f $HOME/.${file##*/} ]] || [[ -d $HOME/.${file##*/} ]]; then
    echo "Moving existing dotfile from $HOME to $olddir"
    mv $HOME/.${file##*/} $olddir
  fi
  #mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $file $HOME/.${file##*/}
done
