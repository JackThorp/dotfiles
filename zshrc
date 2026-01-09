#!/bin/zsh
# This config is run for login shells and for interactive shells

# Revaluate prompt before everytime before displaying
setopt prompt_subst
source ~/.zsh/zsh_ps1
source ~/.shell_aliases

### CONFIGURE GIT ###################################################
zstyle ':completion:*:*:git:*' script ~/.bash/git-completion.bash
fpath=(~/.zsh $fpath)

# See man zshbuiltins for explanation of autoload
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


### PYTHON ###
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

# Colocate pycahce files so empty src directories are not maintained
export PYTHONPYCACHEPREFIX=~/.cache/cpython

# This was slowing down new terminal load. Uncomment if I ever need NVM more regularly.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PG_CLIENT="pgcli"

export PATH="/Users/jack.thorp/.local/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

export KRAKEN_DB_CONCURRENCY=4

 # Added by Kraken Core install script:
eval "$(/opt/homebrew/bin/brew shellenv)"


 # Added by Kraken Core install script:
export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Invoke tab-completion script to be sourced with the Z shell.
# Known to work on zsh 5.0.x, probably works on later 4.x releases as well (as
# it uses the older compctl completion system).
#

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source "$(pyenv which virtualenvwrapper.sh)"


_complete_invoke() {
    # `words` contains the entire command string up til now (including
    # program name).
    #
    # We hand it to Invoke so it can figure out the current context: spit back
    # core options, task names, the current task's options, or some combo.
    #
    # Before doing so, we attempt to tease out any collection flag+arg so we
    # can ensure it is applied correctly.
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    # `reply` is the array of valid completions handed back to `compctl`.
    # Use ${=...} to force whitespace splitting in expansion of
    # $collection_arg
    reply=( $(invoke ${=collection_arg} --complete -- ${words}) )
}


# Tell shell builtin to use the above for completing our given binary name(s).
# * -K: use given function name to generate completions.
# * +: specifies 'alternative' completion, where options after the '+' are only
#   used if the completion from the options before the '+' result in no matches.
# * -f: when function generates no results, use filenames.
# * positional args: program names to complete for.
compctl -K _complete_invoke + -f invoke inv

# vim: set ft=sh :
