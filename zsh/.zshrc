eval "$(starship init zsh)"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/programs/bin:$PATH"

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Setup bat themes
BAT_THEMES_DIR="$(bat --config-dir)/themes"
if [ ! -d "$BAT_THEMES_DIR" ]; then
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

  bat cache --build
fi

# zinit ice depth=1; zinit light romkatv/powerlevel10k
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
# zinit light chrissicool/zsh-256color

autoload -U select-word-style
select-word-style bash

autoload -U compinit && compinit

# Fzf options
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git --exclude brazil-pkg-cache --exclude .cache --exclude WorkDocsDownloads --exclude Downloads'
export FZF_CTRL_T_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}' --height 50%"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza --group-directories-first --tree --color=always {} | head -200'"
 export FZF_DEFAULT_OPTS=" \
 --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#a6e3a1 \
 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
 --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#a6e3a1"

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

# Colors
export BAT_THEME="Catppuccin Mocha"
export LS_COLORS="$(vivid generate catppuccin-mocha)"

# Aliases
alias ls='eza --color=always --icons=always --group-directories-first --oneline'
alias cat='bat'
alias tree='eza --tree --color=always --group-directories-first'
alias vim='nvim'
alias lg='lazygit'
alias lf='lfcd'

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

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


# change directories on lf exit
lfcd () {
  cd "$(command lf -print-last-dir "$@")"
}
bindkey -s '^o' 'lfcd\n'

source ~/.dev.zshrc
