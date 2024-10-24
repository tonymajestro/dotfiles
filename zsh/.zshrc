# Exports
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/programs/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export EZA_IGNORE='-I=".DocumentRevisions*|.fseventsd|.Spotlight-V100|.TemporaryItems|.Trashes|.swo|.swp"'
export EDITOR="nvim"

# Man pages
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Navigation
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Starship
export STARSHIP_CONFIG_DIR=~/.config/starship
export STARSHIP_CONFIG="$STARSHIP_CONFIG_DIR/starship.toml"
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

autoload -U select-word-style
select-word-style bash

autoload -Uz compinit && compinit

# zsh history settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Autocomplete settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias l="eza --color=always --icons=always --group-directories-first --oneline $EZA_IGNORE"
alias ls="eza --color=always --icons=always --group-directories-first --oneline $EZA_IGNORE"
alias ll="eza --color=always --icons=always --group-directories-first --oneline --almost-all --long --header $EZA_IGNORE"
alias cat='bat'
alias tree='eza --tree --color=always --group-directories-first'
alias vim='nvim'
alias lg='lazygit'
alias d='docker'
alias p3='python3'

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
bindkey -s '^o' 'y\n'

# Plugins
source ~/.config/zsh/dev.zshrc
source ~/.config/zsh/colors.zshrc
source ~/.config/zsh/aws.zshrc
source ~/.config/zsh/fzf.zshrc
