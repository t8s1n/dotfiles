# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Jesse's Zsh Configuration

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Case-insensitive completion
CASE_SENSITIVE="false"

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Auto-update oh-my-zsh
zstyle ':omz:update' mode auto

# History configuration
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Plugins
plugins=(
  git
  python
  pip
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  colored-man-pages
  command-not-found
  sudo
)

source $ZSH/oh-my-zsh.sh

# Custom PATH additions
export PATH="$HOME/.npm-global/bin:$PATH"

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Project navigation
export PROJECTS="$HOME/projects"
alias proj='cd $PROJECTS'
alias personal='cd $PROJECTS/personal'
alias work='cd $PROJECTS/work'
alias learn='cd $PROJECTS/learning'
alias play='cd $PROJECTS/playground'

# Downloads organizer
alias organize-downloads='python3 ~/projects/personal/downloads-organizer/organize.py'
alias organize-dry='python3 ~/projects/personal/downloads-organizer/organize.py dry-run'
alias organize-stats='python3 ~/projects/personal/downloads-organizer/organize.py stats'

# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ani-cli settings
export ANI_CLI_QUALITY=1080
export ANI_CLI_DOWNLOAD_DIR="$HOME/Videos/Anime"
export ANI_CLI_PLAYER=/mnt/c/Users/jesse/scoop/apps/mpv/current/mpv.exe

# Aliases
alias ani='ani-cli'
alias anid='ani-cli --dub'
alias anic='ani-cli -c'
alias aniq='ani-cli -q'
alias anidl='ani-cli -d'

# Function to download full season
ani-season() {
    if [ -z "$1" ]; then
        echo "Usage: ani-season 'anime name' start-end"
        echo "Example: ani-season 'naruto' 1-12"
        return 1
    fi
    ani-cli "$1" -d -e "${2:-1-12}"
}

# Function to continue last anime
ani-last() {
    ani-cli -c
}

# Update ani-cli
ani-update() {
    sudo ani-cli -U
}

# Check ani-cli setup
ani-check() {
    echo "Checking ani-cli setup..."
    echo ""
    echo -n "ani-cli: "
    command -v ani-cli >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo -n "mpv: "
    command -v mpv.exe >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo -n "fzf: "
    command -v fzf >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo -n "aria2c: "
    command -v aria2c >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo -n "yt-dlp: "
    command -v yt-dlp >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo -n "patch: "
    command -v patch >/dev/null && echo "✓ Installed" || echo "✗ Missing"
    echo ""
    echo "Quality setting: ${ANI_CLI_QUALITY:-not set}"
    echo "Download dir: ${ANI_CLI_DOWNLOAD_DIR:-current directory}"
}
