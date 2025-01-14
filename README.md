# Dotfiles
This repository contains dotfiles for nvim, fish, starship, and other dev programs.

## Usage
This repository takes advantage of [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks to the appropriate dotfile directory.
This can be installed using homebrew or any other popular package manager.

```brew install stow```

Next, clone the repository into your home directory and use stow to create symlinks to the appropriate locations:

```
git clone git@github.com:tonymajestro/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow nvim
stow fish
stow starship
```
