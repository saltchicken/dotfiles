local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "/bin/bash", "-c", "sleep 1 && unimatrix -s 95 -l 'oc' -f -c green" }
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0, -- Padding on the left side
	right = 0, -- Padding on the right side
	top = 0, -- Padding on the top
	bottom = 0, -- Padding on the bottom
}

return config
