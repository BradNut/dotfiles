# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# Useful aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias update="source ~/.zshrc"
