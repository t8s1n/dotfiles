#!/bin/bash

# Dotfiles Setup Script
# This script creates symlinks from home directory to dotfiles directory

DOTFILES_DIR="$HOME/dotfiles"
HOME_DIR="$HOME"

echo "Creating symlinks for dotfiles..."

# Backup existing files if they exist
backup_if_exists() {
    if [ -f "$1" ]; then
        echo "Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Create symlinks
create_symlink() {
    local source="$DOTFILES_DIR/$1"
    local target="$HOME_DIR/$1"
    
    backup_if_exists "$target"
    
    echo "Symlinking $source -> $target"
    ln -sf "$source" "$target"
}

# Symlink all config files
create_symlink ".zshrc"
create_symlink ".gitconfig"

echo "Dotfiles setup complete!"
echo "Reload your shell with: source ~/.zshrc"
