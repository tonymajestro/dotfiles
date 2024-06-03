#!/bin/sh

NVIM_HOME=~/.config/nvim/
HOME=~/

#! /bin/sh
brew install fzf
brew install fd
brew install wget
brew install zoxide
brew install tlrc
brew install tmux

# Copy zshrc
cp .zshrc $HOME

# Copy tmux config
cp .tmux.conf $HOME

# Copy nvim
mkdir -p $NVIM_HOME
cp -r nvim/* $NVIM_HOME

# Copy p10k config
cp .p10k.zsh $HOME
