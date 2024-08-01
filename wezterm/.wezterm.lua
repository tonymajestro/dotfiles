local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.font_size = 22
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")

-- and finally, return the configuration to wezterm
return config
