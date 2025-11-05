# My Dotfiles

Personal configuration files for development environment.

## Files Included

- `.zshrc` - Zsh shell configuration
- `.gitconfig` - Git configuration
- `config.sh` - Setup script for symlinking dotfiles

## Installation
```bash
# Clone this repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run setup script
cd ~/dotfiles
./config.sh

# Reload shell
source ~/.zshrc
```

## Manual Installation
```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
source ~/.zshrc
```
