TMUX_CONFIG=~/.tmux.conf
TMUX_DARK_CONFIG=~/.tmux.dark.conf
TMUX_LIGHT_CONFIG=~/.tmux.light.conf

# Setup bat repos
BAT_THEMES_DIR="$(bat --config-dir)/themes"
if [ ! -d "$BAT_THEMES_DIR" ]; then
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
  wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

  bat cache --build
fi

# Set colors based on Mac theme
if [[ "$(uname -s)" == "Darwin" ]]; then
  theme=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
fi

if [[ $theme == "Dark" ]]; then
  # Dark Mode
  export BAT_THEME='Catppuccin Macchiato'
  export NVIM_THEME='catppuccin-macchiato'
  export LS_COLORS="$(vivid generate catppuccin-macchiato)"
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#c6a0f6 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#c6a0f6"

  cat "$STARSHIP_CONFIG_DIR/starship.dark.toml" > "$STARSHIP_CONFIG"
  cat "$TMUX_DARK_CONFIG" > $TMUX_CONFIG
else
  # Light Mode
  export BAT_THEME='Catppuccin Latte'
  export NVIM_THEME='catppuccin-latte'

  export LS_COLORS="$(vivid generate catppuccin-latte)"
  export FZF_DEFAULT_OPTS=" \
  --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#8839ef \
  --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
  --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#8839ef" 

  cat "$STARSHIP_CONFIG_DIR/starship.light.toml" > "$STARSHIP_CONFIG"
  cat "$TMUX_LIGHT_CONFIG" > $TMUX_CONFIG
fi

