# Dotfiles

This repository includes my personal configuration for OSX. In
particular, it provides configuration files for Alacritty, and Neovim.

# Usage

This repositoyy utilizes GNU Stow to manage the dotfiles and configuration
files. GNU Stow creates symlinks from this repository to the appropriate
locations, allowing for synchronization and maintenance of configurations
across different machines.

## Prerequisites

1. Install GNU Stow

```bash
brew install stow
```

## Installation

1. Clone the repository

```bash
git clone https://github.com/jucgonzalezes/dotfiles.git
cd dotfiles
```

2. Use GNU Stow

```bash
stow -v -R -t ~ alacritty git nvim tmux zsh
```

# License

This project is licensed under the MIT License - see the LICENSE file for details.

# Author

Juan C Gonzalez-Espitia
