#!/bin/zsh

# Assume that this script is in the root of the dotfiles repo/project
DOTFILES_DIR=${0:a:h}
TARGET_DIR='~'

# TODO: add a dry-run option which uses the '--simulate' flag. 
# TODO: consider using the '--adopt' flag to bring changes from conflicts in target directory into stow directories so they can be diffed via version control.
# TODO: add a removal option that uses the '--delete' flag?
#

# Stow every directory in this directory apart from 
# The benefit of stow is that for dotfiles such as .config (that lots of apps use) we don't 
# simply overwrite the whole directory. Instead stow only symlinks the missing children in order
# to make the stow and target directories match.
for f in `ls -d */`; do
    echo "stowing $f"
    stow --verbose=0 --adopt "$f"
done

echo "All done!"
