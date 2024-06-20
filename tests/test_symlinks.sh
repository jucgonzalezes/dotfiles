#!/bin/bash

# Check if .bashrc is symlinked
if [ ! -L "$HOME/.zshrc" ]; then
	echo ".zshrc is not symlinked"
	exit 1
fi

echo "All symlinks created successfully"
exit 0
