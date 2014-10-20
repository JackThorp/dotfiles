#!/bin/sh

### SELECT GNU COMMANDS ###########################################
# For those commands that require a g prefix, select if exist
# Lawrence! WHAT IS THE G prefix for? Won't this still create alias even if g prefix doesn't exist?
cmds="ls grep find dircolors"
for cmd in $cmds
do
  $(which g$cmd >/dev/null 2>/dev/null) && alias $cmd="g$cmd"
done

### CONFIGURE TERMINAL COLORS #####################################
# set the ls folder and file support
# set CLICOLOR if we want ANSI colour support
export CLICOLOR=1
export TERM=xterm-256color
export CLRCOL=$'\e[0m'

# Set the theme name
export theme="molokai"
source ~/.colors/colors.$theme

# Set terminal to color on
force_color_prompt=yes
# Double check color support#
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

### CONFIGURE LS AND GREP ###########################################
# Alias ls colors if supported
$(ls --color=always &>/dev/null) && alias ls='ls --color=always'

# If supported then run dircolors
if [[ $(dircolors 2>/dev/null) ]]
then
  $(gls --color=always &>/dev/null) && alias ls='gls --color=always'
  test -r ~./.dircolors/dircolors.$theme &&
    eval "$(dircolors -b ~/.dircolors/dircolors.$theme &>/dev/null)" || eval "$(dircolors -b)"
else
  # Default ls and colors
  export LSCOLORS=GxFxCxDxBxegedabagaced
fi

# Force color output in tree
alias tree='tree -C'

### OTHER ##########################################################
source ~/.bash_aliases
source ~/.bash_ps1
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=vim
