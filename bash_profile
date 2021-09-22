[[ -r ~/.bashrc ]] && . ~/.bashrc

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Insert shims for running black and isort in container
# export PATH=/Users/jackthorp/projects/kraken-core-dev/shims:$PATH
