local wezterm = require("wezterm")

local config = wezterm.config_builder()

local opacity = 0.7

-- Helper function to get files in backgrounds directory
-- TODO: Make this a separate lua file helper.lua
local function listFilesInDirectory(directory)
	local files = {}
	-- Use 'ls' command to list files in the directory
	local handle = io.popen("ls " .. directory)
	local result = handle:read("*a") -- Read the output of the command
	handle:close()

	for file in result:gmatch("[^\n]+") do
		table.insert(files, directory .. "/" .. file)
	end

	return files
end

config.window_background_opacity = opacity
config.hide_tab_bar_if_only_one_tab = true

config.default_prog = { "tmux", "a", "-t", "0" }

config.initial_rows = 50
config.initial_cols = 256

-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.background = {
	{
		source = {
			-- File = "/home/saltchicken/.config/wezterm/backgrounds/middle_frame.png", -- Path to your image file
			-- Gradient = { preset = "Warm" },
			Color = "#171c19",
		},
		height = "100%",
		opacity = opacity, -- Opacity of the background image
		width = "100%",
	},
}

config.window_padding = {
	left = 10, -- Padding on the left side
	right = 10, -- Padding on the right side
	top = 6, -- Padding on the top
	bottom = 6, -- Padding on the bottom
}

local current_background_index = 1

local backgrounds = listFilesInDirectory("/home/saltchicken/.config/wezterm/backgrounds")
table.insert(backgrounds, 1, "#171c19")

wezterm.on("toggle-background", function(window, pane)
	for _, file in ipairs(backgrounds) do
		print(file)
	end
	local overrides = window:get_config_overrides() or {}
	-- print(overrides.background)
	-- if not overrides.background then
	current_background_index = (current_background_index % #backgrounds) + 1
	local new_background = backgrounds[current_background_index]

	-- Check if new_background contains a solid color or path to image
	if string.find(new_background, "#") ~= nil then
		overrides.background = {
			{
				source = {
					Color = "#171c19",
				},
				height = "100%",
				width = "100%",
				opacity = opacity,
			},
		}
	else
		overrides.background = {
			{
				source = {
					File = backgrounds[current_background_index],
				},
				opacity = opacity,
				width = "100%",
			},
		}
	end
	-- else
	-- 	print("Something wrong with wezterm.on toggle-background")
	-- overrides.background = "/home/saltchicken/Pictures/middle_frame.png"
	-- end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "b",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-background"),
	},
}

return config
