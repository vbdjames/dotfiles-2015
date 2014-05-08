#!/bin/bash
################################################################################
#
# makesymlinks.sh
# This script creates symlinks from the home directory to dotfiles in ~/dotfiles
#
################################################################################

dir=~/dotfiles
olddir=~/dotfiles_old
files="vim vimrc zshrc"   # list of files/folders to symlink in homedir

# create dorfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move existing dorfiles in homedir to dotfiles_old, then create symlinks
for file in $files; do
    echo "Moving existing dotfile from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

