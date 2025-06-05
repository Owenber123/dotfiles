-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "xterm-256color"
config.color_scheme = "Tokyo Night"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.background = {
	{
		source = {
			File = "/Users/owenberinger/Pictures/Background/triangles-neon-colors-8k-jx-3440x1440.jpg.png",
		},
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.25,
		},
		width = "100%",
		height = "100%",
	},
	{
		source = {
			Color = "#222222",
		},
		width = "100%",
		height = "100%",
		opacity = 0.8,
		-- opacity = 1.0,
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
