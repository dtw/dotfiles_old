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
files=($(find $dir -maxdepth 1 -mindepth 1)) # find all files and folders
ignore_files=(.git LICENSE README.md createlinks.sh getvimbundles.sh) # files/folders you don't want linked

# delete files from the list we want to ignore
for i in "${ignore_files[@]}"; do
  files=(${files[@]//$dir\/$i}) # list of files/folders to symlink in homedir 
done

# create dotfiles_old in homedir
[[ ! -d $olddir ]]  && mkdir -p $olddir && echo "Creating $olddir for backup of any existing dotfiles in $HOME"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in ${files[@]}; do
  if [[ -f $HOME/.${file##*/} ]] || [[ -d $HOME/.${file##*/} ]]; then
    echo "Moving existing .${file##*/} from $HOME to $olddir"
    mv $HOME/.${file##*/} $olddir
  fi
  echo "Creating symlink to $file in home directory."
  ln -s $file $HOME/.${file##*/}
done
