#!/bin/bash
# symlink.sh
# This script makes symlinks from the home directory to the dotfiles in the dotfiles folder.

###### Variables ######

dir=~/dotfiles
olddir=~/dotfiles_old

######################

# create dotfiles_old in homedir
if [ -d $olddir ];
then
  echo Cleaning old backup
  rm -rf $olddir
fi
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir into the dotfiles_old directory, then create symlinks
for f in `ls | grep -iv "symlink"`; do
  if [ -a ~/.$f ];
  then
    mv ~/.$f ~/dotfiles_old/
  fi
  rm -f ~/.$f
  echo " Symlinking .$f"
  ln -s $dir/$f ~/.$f
done

echo done!
