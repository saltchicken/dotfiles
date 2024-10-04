local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

config.background = {
	{
		source = {
			File = "/home/saltchicken/Pictures/middle_frame.png", -- Path to your image file
		},
		-- height = "50%",
		opacity = 0.7, -- Opacity of the background image
		width = "100%",
	},
}
return config
