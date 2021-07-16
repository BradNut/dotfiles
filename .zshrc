# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH

ZSH_THEME="robbyrussell"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  node
  npm
  osx
  extract
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# Useful aliases
alias rm=trash
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias update="source ~/.zshrc"
alias code="codium"

# Git
alias branch="git branch"
alias gco="git checkout"
alias status="git status"

# Docker
alias dcp='docker-compose -f /opt/docker-compose.yml '
alias dcpull='docker-compose -f /opt/docker-compose.yml pull --parallel'
alias dclogs='docker-compose -f /opt/docker-compose.yml logs -tf --tail="50" '
alias dtail='docker logs -tf --tail="50" "$@"'

# SDK Man
# OSX SDK Man
# export SDKMAN_DIR=$HOME/.sdkman
# [[ -s "/Users/{USER_NAME}/.sdkman/bin/sdkman-init.sh"]] && source "/Users/{USER_NAME}/.sdkman/bin/sdkman-init.sh"
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/bin:$PATH"
