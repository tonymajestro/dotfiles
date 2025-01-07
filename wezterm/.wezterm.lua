local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 16
config.color_scheme = "Catppuccin Macchiato"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.max_fps = 144

config.window_padding = {
	left = 14,
	right = 14,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

if wezterm.target_triple == "aarch64-apple-darwin" then
	config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
else
	config.default_prog = { "/usr/bin/fish", "-l" }
end

-- keybindings
config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}
config.keys = {
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "l",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "h",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "y",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
}

return config
