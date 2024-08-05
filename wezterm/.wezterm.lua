local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

config.font_size = 14
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 14,
	right = 14,
	top = 0,
	bottom = 0,
}

return config
