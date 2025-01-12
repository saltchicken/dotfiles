local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local width_ratio = 0.4
	local height_ratio = 0.7
	local width, height = screen.width * width_ratio, screen.height * height_ratio
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = "ActiveScreen",
		},
	})
	window:gui_window():set_inner_size(width, height)
end)

local mux = wezterm.mux

-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)

local config = wezterm.config_builder()
-- config.wsl_domains = {
-- 	{
-- 		name = "WSL:Ubuntu",
-- 		distribution = "Ubuntu",
-- 	},
-- }
-- config.default_domain = "WSL:Ubuntu"

config.window_background_opacity = 0.8 -- Adjust this value between 0.0 and 1.0
config.color_scheme = "Breath (Gogh)"

config.term = "xterm-256color"

config.font_size = 10

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"

config.window_padding = {
	top = 10,
	bottom = 10,
	left = 10,
	right = 10,
}

-- config.initial_rows = 60
-- config.initial_cols = 150

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

local action = wezterm.action

config.keys = {
	{
		key = "\\",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "o",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Next"),
	},
	{
		key = "o",
		mods = "SHIFT|LEADER",
		action = action.ActivatePaneDirection("Prev"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = action.TogglePaneZoomState,
	},
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },
	{
		key = "c",
		mods = "LEADER",
		action = action.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "p",
		mods = "LEADER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = action.ActivateTabRelative(1),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

return config
