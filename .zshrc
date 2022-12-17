# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH

#ZSH_THEME="robbyrussell"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  node
  npm
  macos
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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# pnpm
export PNPM_HOME="/home/bshellnu/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
eval "$(starship init zsh)"
