#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
	echo "Homebrew not found, installing..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# cd ..
echo "Current directory: $PWD"

# Install prerequisites using Brewfile
echo "Installing packages with brew..."
brew bundle --file="Brewfile"

# Change permissions
# chmod go-w '/usr/local/share'
# chmod -R go-w '/usr/local/share/zsh'

if [ -f ~/.gitconfig ]; then
	echo ".gitconfig file already exists. Backing up."
	mv ~/.gitconfig ~/.gitconfig.bak
fi

# Stow the dotfiles
stow -v -R -t ~ alacritty git nvim tmux zsh
