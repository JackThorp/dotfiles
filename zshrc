#!/bin/zsh
# This config is run for login shells and for interactive shells

# Revaluate prompt before everytime before displaying
setopt prompt_subst
source ~/.zsh/zsh_ps1
source ~/.shell_aliases

### CONFIGURE GIT ###################################################
zstyle ':completion:*:*:git:*' script ~/.bash/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

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

export EDITOR=vim


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### KRAKEN ENV VARS
export TENTACLIO__SECRETS_FILE=~/.tentaclio.yaml
export AWS_PROFILE=oe-prod


### PYTHON ###
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

eval "$(pyenv init --path)"
export WORKON_HOME=$HOME/.virtualenvs
# eval "$(pyenv virtualenvwrapper-init -)"
# source "$(pyenv which virtualenvwrapper.sh)"
source "/usr/local/bin/virtualenvwrapper.sh"

# Colocate pycahce files so empty src directories are not maintained
export PYTHONPYCACHEPREFIX=~/.cache/cpython

# RabbitMQ
export PATH=/usr/local/sbin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
