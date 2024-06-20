#!/bin/bash

# Test if brew is installed
if ! command -v brew &>/dev/null; then
	echo "Homebrew is not installed"
	exit 1
fi

# Test if stow is installed
if ! command -v stow &>/dev/null; then
	echo "Stow is not installed"
	exit 1
fi

# Test if alacritty is installed
if ! command -v alacritty &>/dev/null; then
	echo "Alacritty is not installed"
	exit 1
fi

# Test if nvim is installed
if ! command -v vim &>/dev/null; then
	echo "Vim is not installed"
	exit 1
fi

echo "All software installed successfully"
exit 0
