# DOCKER COMMANDS
alias dcu='docker-compose up'
alias dcr='docker-compose restart'
alias dcd='docker-compose down'
alias dce='docker-compose exec'

# GIT COMMANDS
alias gs='git status'
alias gco='git commit'
alias gb='git branch'
alias gch='git checkout'
alias gl='git log -n 10 --oneline'
alias gd='git diff'
alias ga='git add'
alias gpf='git push --force-with-lease'

# POSTGRES
alias replica-db='pgcli -h postgres-proxy.octopus.energy -U bastion consumer'
alias test-db='pgcli -h postgres-proxy.octopus.systems -U bastion consumer'
alias local-db='cd ~/projects/octodev && dce db psql -U postgres octo-consumer-2019-04-19'
