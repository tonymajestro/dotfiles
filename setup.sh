#/bin/sh

NVIM_HOME=~/.config/nvim

# Install programs if -i or --install is passed
if [[ $1 =~ ^(-i|--install) ]]
then
  brew install fzf
  brew install fd
  brew install wget
  brew install zoxide
  brew install tlrc
  brew install tmux
fi

# Copy zshrc
cp .zshrc $HOME

# Copy tmux config
cp .tmux.conf $HOME

# Copy p10k config
cp .p10k.zsh $HOME

# Copy nvim
mkdir -p $NVIM_HOME
cp -r nvim/* $NVIM_HOME
