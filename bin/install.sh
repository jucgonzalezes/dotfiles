#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
	echo "Homebrew not found, installing..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install prerequisites using Brewfile
echo "Installing packages with brew..."
brew bundle --file="../Brewfile"

# Change permissions
# chmod go-w '/usr/local/share'
# chmod -R go-w '/usr/local/share/zsh'

# Stow the dotfiles
cd ..
stow -v -R -t ~ alacritty git nvim tmux zsh
