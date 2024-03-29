#!/bin/sh

source ~/.shell_aliases
source ~/.bash/bash_ps1


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


# FZF needs a list of files to perform fuzzy find on
export FZF_DEFAULT_COMMAND="rg --files -g '!{.git,node_modules}'"

# Force color output in tree
alias tree='tree -C'

### CONFIGURE GIT ###################################################
source ~/.bash/git-completion.bash


### NODE VERSION MANAGER ###########################################
# NODE_PATH not set as all dependencies should be put in node_modules. Globals shouldn't be required from
# within a node application? NVM handles putting globals on the PATH. 

### LOAD NVM ###
export NVM_DIR="$HOME/.nvm"
[ -d $NVM_DIR ] || mkdir $NVM_DIR
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # -s => file exists. So source and load nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export GOPATH=$HOME/go
export EDITOR=vim


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### KRAKEN ENV VARS
export TENTACLIO__SECRETS_FILE=~/.tentaclio.yaml
export AWS_PROFILE=oe-prod


### PYTHON ###
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}
