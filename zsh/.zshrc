# Path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/programs/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export EDITOR="nvim"

# Man pages
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Naviagion
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Starship
export STARSHIP_CONFIG_DIR=~/.config/starship
export STARSHIP_CONFIG="$STARSHIP_CONFIG_DIR/starship.toml"
eval "$(starship init zsh)"

autoload -U select-word-style
select-word-style bash

autoload -Uz compinit && compinit

# Fzf options
export FZF_EXCLUDES='--exclude .git --exclude brazil-pkg-cache --exclude .cache --exclude Downloads --exclude Library --exclude go --exclude WorkDocsDownload --exclude .vscode --exclude .workspace --exclude build --exclude env --exclude .bemol --exclude .idea --exclude .brazil --exclude logs'
export FZF_DEFAULT_COMMAND="fd --hidden $FZF_EXCLUDES"
export FZF_CTRL_T_COMMAND="fd --type f $FZF_EXCLUDES"
export FZF_CTRL_T_OPTS='--tmux 90%'
export FZF_ALT_C_COMMAND="fd . --full-path $HOME --type d --hidden --follow $FZF_EXCLUDES"
export FZF_ALT_C_OPTS='--tmux 90%'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude ".git" --exclude brazil-pkg-cache . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" --exclude brazil-pkg-cache . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always --group-directories-first {} | head -200'  "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always --line-range :500 {}' "$@" ;;
  esac
}

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

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Aliases
alias l='eza --color=always --icons=always --group-directories-first --oneline'
alias ls='eza --color=always --icons=always --group-directories-first --oneline'
alias ll='eza --color=always --icons=always --group-directories-first --oneline --all --long --header'
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

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
bindkey -s '^o' 'y\n'



colorRefresh() {
  source ~/.colors.zshrc
  if [ ! -z $TMUX ]; then
    tmux set -g @plugin 'catppuccin/tmux'
    tmux set -g @catppuccin_flavour "$TMUX_THEME"
    tmux source-file $TMUX_CONFIG
  fi
}
bindkey -s '^v' 'colorRefresh\n'

# Plugins
source ~/.dev.zshrc
source ~/.colors.zshrc

if type brew &>/dev/null; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Scripts
assumeRole() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN

  export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn $1 \
    --role-session-name MySessionName \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.config/tmux-sessionizer:$PATH"
