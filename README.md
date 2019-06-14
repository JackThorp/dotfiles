# Git Templates
Run git config --global init.templatedir '~/.git_template' to set the .git_template dotfile
as the default template file for new repositories. You can run git init inside existing 
repositories to install (new) templates.
Running git config --global alias.ctags '!.git/hooks/ctags' will set up a git ctags command to 
execute the ctags hook in the current repo.
