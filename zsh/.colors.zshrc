# Set colors based on Mac theme
if [[ "$(uname -s)" == "Darwin" ]]; then
  val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
  if [[ $val == "Dark" ]]; then
    # Dark Mode
    export BAT_THEME='Catppuccin Macchiato'
    export NVIM_THEME='catppuccin-macchiato'
    export TMUX_THEME='Macchiato'
    export STARSHIP_CONFIG=~/.config/starship/starship.dark.toml

    export LS_COLORS="$(vivid generate catppuccin-macchiato)"

    export FZF_DEFAULT_OPTS=" \
      --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
      --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
      --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
  else
    # Light Mode
    export BAT_THEME='Catppuccin Latte'
    export NVIM_THEME='catppuccin-latte'
    export TMUX_THEME='Latte'
    export STARSHIP_CONFIG=~/.config/starship/starship.light.toml

    export LS_COLORS="$(vivid generate catppuccin-latte)"

    export FZF_DEFAULT_OPTS=" \
    --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
    --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
    --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39" export LS_COLORS="$(vivid generate catppuccin-latte)"
  fi
fi

# Set tmux colors
if [ ! -z $TMUX ]; then
  tmux set -g @plugin 'catppuccin/tmux'
  tmux set -g @catppuccin_flavour "$TMUX_THEME"
  tmux run '~/.tmux/plugins/tpm/tpm'
fi

# Setup bat repos
BAT_THEMES_DIR="$(bat --config-dir)/themes"
if [ ! -d "$BAT_THEMES_DIR" ]; then
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

  bat cache --build
fi
