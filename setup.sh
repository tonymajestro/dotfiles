#! /bin/sh
brew install fzf
brew install fd
brew install wget
brew install zoxide
brew install tlrc
brew install tmux

# Copy zshrc
cp .zshrc ~/.zshrc

# Copy tmux config
cp .tmux.conf ~/.tmux.conf

# Copy nvim
NVIM_HOME=~/.config/nvim
mkdir -p $NVIM_HOME
cp -r nvim $NVIM_HOME
