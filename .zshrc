# Jesse's Zsh Configuration

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Custom PATH additions
export PATH="$HOME/.npm-global/bin:$PATH"

# API Keys and Environment Variables
export ANTHROPIC_API_KEY="your-key-here"

# Aliases
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gp='git pull'
alias gc='git commit'

# Custom functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}
