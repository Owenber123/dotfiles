-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "xterm-256color"
config.color_scheme = "OneDark (base16)"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.background = {
	{
		source = {
			Color = "#222222",
		},
		width = "100%",
		height = "100%",
		-- opacity = 0.95,
		opacity = 1.0,
	},
}

config.window_padding = {
	left = 5,
	right = 0,
	top = 10,
	bottom = 0,
}

-- config.scrollback_lines = 10000

return config
