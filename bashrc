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


export FZF_DEFAULT_COMMAND="rg --files -g '!{.git,node_modules}'"

### Stop stderr of boot2docker ip showin in terminal
docker-ip() {
  boot2docker ip 2> /dev/null
}
# Force color output in tree
alias tree='tree -C'

source ~/.bash_aliases
source ~/.bash_ps1

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
#export CLOUDSTACK_API_URL="https://cloudstack.doc.ic.ac.uk:8443/client/api"
#export CLOUDSTACK_API_KEY="JObiUuA1sLKH_FZNrbICqE_6hnqp2yjZBIOQar1EfQf1aVu0f9K1zLMycXBDpu2izXp2kvIZ3OrHWhjsYRRjYg"
#export CLOUDSTACK_SECRET_KEY="Sr1AEjkm_8Ub7Ask6hDRI1AWJ007_pPyaSP_DDcQzT0WtV3zowT_g4yxq-4NDvDxTq3AGvejYnIicqjOs1ebBQ"
#export DOCKER_CERT_PATH=/Users/jackthorp/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
