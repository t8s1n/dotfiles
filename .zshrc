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

# ============================================
# ALIASES - Quality of Life Improvements
# ============================================

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'  # Go to previous directory

# List variations
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhtr'  # Sort by time, newest last
alias lsize='ls -lhS'  # Sort by size

# Safety nets
alias rm='rm -i'  # Confirm before delete
alias cp='cp -i'  # Confirm before overwrite
alias mv='mv -i'  # Confirm before overwrite
alias mkdir='mkdir -pv'  # Create parent dirs, verbose

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git pull'
alias gph='git push'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'
alias gcl='git clone'

# Quick editing
alias zshrc='cursor ~/.zshrc'
alias reload='source ~/.zshrc'
alias hosts='sudo cursor /etc/hosts'

# System shortcuts
alias c='clear'
alias h='history'
alias path='echo $PATH | tr ":" "\n"'  # Show PATH nicely
alias ports='netstat -tulanp'  # Show open ports

# Development
alias py='python3'
alias pip='pip3'
alias serve='python3 -m http.server'  # Quick HTTP server
alias myip='curl ifconfig.me'  # Get public IP

# WSL specific
alias open='explorer.exe'
alias pbcopy='clip.exe'  # Copy to clipboard
alias winhome='cd /mnt/c/Users/$USER'

# Dotfiles management
alias dots='cd ~/dotfiles'
alias dotpush='cd ~/dotfiles && git add . && git commit -m "Update dotfiles" && git push'

# Directory bookmarks
alias dev='cd ~/projects'
alias docs='cd ~/documents'
alias dl='cd ~/downloads'

# File operations
alias grep='grep --color=auto'
alias count='find . -type f | wc -l'  # Count files
alias sizeof='du -sh'  # Size of directory

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # Search processes
alias kill9='kill -9'  # Force kill

# Quick functions (these are actually functions, not aliases)
mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.gz|*.tgz) tar xzf "$1" ;;
            *.tar.bz2|*.tbz2) tar xjf "$1" ;;
            *.zip) unzip "$1" ;;
            *.gz) gunzip "$1" ;;
            *) echo "Don't know how to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick backup
backup() {
    cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Find and kill process by name
killp() {
    ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# FOr Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'

# npm
alias ni='npm install'
alias nid='npm install --save-dev'
alias ns='npm start'
alias nt='npm test'

# directories syntax
alias myproject='cd ~/projects/my-important-project'