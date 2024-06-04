#/bin/sh

NVIM_HOME=~/.config/nvim/

cp $HOME/.zshrc .
cp $HOME/.tmux.conf .
cp $HOME/.p10k.zsh .
cp -r $NVIM_HOME/* nvim
