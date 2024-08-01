local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato"
config.font_size = 22

-- and finally, return the configuration to wezterm
return config
