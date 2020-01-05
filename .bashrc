# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Building Aliases
alias mcist="mvn clean install -DskipTests"
alias mci="mvn clean install"

# Git Aliases
alias gco='git checkout'
alias branch='git branch'
alias status='git status'

# Directory Aliases
alias lsa="ls -la"
alias ll='ls -FGlahp'

alias f='open -a Finder ./'
