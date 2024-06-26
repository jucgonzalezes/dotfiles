[![CI](https://github.com/jucgonzalezes/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/jucgonzalezes/dotfiles/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

2. Install p10k

```bash
brew install powerlevel10k
```

3. Install fzf

```bash
brew install fzf
```

3. Install Meslo Lg Nerd Font

```bash
brew install font-meslo-lg-nerd-font
```

4. Install ZSH extensions

WARNING: The installation may include changing the permissions of some folders
and forcing rebuilds.

```bash
brew install zsh-autosuggestions
brew install zsh-syyntax-highlighting
brew install zsh-completions
```

## Installation

1. Clone the repository

```bash
git clone https://github.com/jucgonzalezes/dotfiles.git
cd dotfiles
```

2. Install alacritty

```bash
brew install alacritty
```

3. Install Neovim

```bash
brew install nvim
```

4. Use GNU Stow

```bash
stow -v -R -t ~ alacritty git nvim tmux zsh
```

# License

This project is licensed under the MIT License - see the LICENSE file for details.

# Author

Juan C Gonzalez-Espitia
