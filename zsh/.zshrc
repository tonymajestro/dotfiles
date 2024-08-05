# Path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/programs/bin:$PATH"

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
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git --exclude brazil-pkg-cache --exclude .cache --exclude WorkDocsDownloads --exclude Downloads'
export FZF_CTRL_T_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}' --height 50%"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza --group-directories-first --tree --color=always {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
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
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias ls='eza --color=always --icons=always --group-directories-first --oneline'
alias cat='bat'
alias tree='eza --tree --color=always --group-directories-first'
alias vim='nvim'
alias lg='lazygit'
alias lf='lfcd'
alias d='docker'

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^o' lfcd
bindkey -s '^v' 'source ~/.zshrc\n'

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# change directories on lf exit
lfcd () {
  cd "$(command lf -print-last-dir "$@")"
}
bindkey -s '^o' 'lfcd\n'

# Plugins
source ~/.dev.zshrc
# source ~/.colors.zshrc

if type brew &>/dev/null; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
