local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font_size = 22
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 12,
	right = 12,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
