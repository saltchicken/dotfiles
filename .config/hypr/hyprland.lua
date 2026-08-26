---@module 'hl'

--###############

--## MONITORS ###

--###############

-- See https://wiki.hypr.land/Configuring/Monitors/

hl.monitor({
	output = "DP-3",
	mode = "5120x1440@120",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "VIRTUAL-1",
	mode = "1920x1080@60",
	position = "5501x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-2",
	mode = "2560x1600@60",
	position = "-5120x0",
	scale = 1,
})

hl.workspace_rule({
	workspace = 9,
	monitor = "VIRTUAL-1",
	default = true,
})

hl.workspace_rule({
	workspace = 10,
	monitor = "HDMI-A-2",
	default = true,
})

--##################

--## MY PROGRAMS ###

--##################

local terminal = "kitty"

local fileManager = "dolphin"

local menu = "fuzzel"

--################

--## AUTOSTART ###

--################

--################

--## Programs

--############################

--## ENVIRONMENT VARIABLES ###

--############################

hl.env("XCURSOR_SIZE", 24)

hl.env("HYPRCURSOR_SIZE", 24)

--##################

--## PERMISSIONS ###

--##################

-- See https://wiki.hypr.land/Configuring/Permissions/

-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly

-- for security reasons

-- ecosystem {

--   enforce_permissions = 1

-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow

-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow

-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

--####################

--## LOOK AND FEEL ###

--####################

-- Refer to https://wiki.hypr.land/Configuring/Variables/

-- https://wiki.hypr.land/Configuring/Variables/#general

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		-- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
		allow_tearing = true,
		layout = "master",
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
	},
})

-- https://wiki.hypr.land/Configuring/Variables/#decoration

hl.config({
	decoration = {
		rounding = 0,
		rounding_power = 0,
		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		-- https://wiki.hypr.land/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 1,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})

-- https://wiki.hypr.land/Configuring/Variables/#animations

hl.config({
	animations = {
		enabled = false,
		-- Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
		--        NAME,           X0,   Y0,   X1,   Y1
		-- Default animations, see https://wiki.hypr.land/Configuring/Animations/
		--           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
	},
})

hl.config({
	render = {
		direct_scanout = true,
	},
})

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/

-- "Smart gaps" / "No gaps when only"

-- uncomment all if you wish to use that.

-- workspace = w[tv1], gapsout:0, gapsin:0

-- workspace = f[1], gapsout:0, gapsin:0

-- windowrule {

--     name = no-gaps-wtv1

--     match:float = false

--     match:workspace = w[tv1]

--

--     border_size = 0

--     rounding = 0

-- }

--

-- windowrule {

--     name = no-gaps-f1

--     match:float = false

--     match:workspace = f[1]

--

--     border_size = 0

--     rounding = 0

-- }

-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more

hl.config({
	dwindle = {
		-- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true,
		-- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more

hl.config({
	master = {
		new_status = "slave",
		orientation = "center",
		slave_count_for_center_master = 0,
		mfact = 0.5,
		new_on_active = "after",
		drop_at_cursor = true,
		-- new_on_top = true
	},
})

-- https://wiki.hypr.land/Configuring/Variables/#misc

hl.config({
	misc = {
		force_default_wallpaper = -1,
		-- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true,
		-- If true disables the random hyprland logo / anime girl background. :(
	},
})

--############

--## INPUT ###

--############

-- https://wiki.hypr.land/Configuring/Variables/#input

hl.config({
	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0,
		-- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
		},
		-- 1. Ignore tiny mouse nudges inside the same window
		mouse_refocus = false,
		-- 2. Stop focus-stealing between tiled and floating windows
		float_switch_override_focus = 0,
	},
})

-- See https://wiki.hypr.land/Configuring/Gestures

-- TODO: manual review: gesture = 3, "horizontal", "workspace"

-- Example per-device config

-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.device({
	name = "wacom-intuos-s-pen",
	output = "DP-3",
	region_size = { 2560, 1440 },
	region_position = { 1280, 0 },
	active_area_size = { 152, 85.5 },
})

hl.device({
	name = "wacom-cintiq-16-pen",
	output = "HDMI-A-2",
})

--##################

--## KEYBINDINGS ###

--##################

-- See https://wiki.hypr.land/Configuring/Keywords/

local mainMod = "SUPER"

-- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())

hl.bind(
	mainMod .. " + " .. "M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo())

-- dwindle

-- bind = $mainMod, J, layoutmsg, togglesplit # dwindle

-- Master Layout Controls

hl.bind(mainMod .. " + " .. "F", hl.dsp.layout("swapwithmaster"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "h", hl.dsp.layout("swapnext"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "l", hl.dsp.layout("swapprev"))

hl.bind(mainMod .. " + " .. "O", hl.dsp.layout("orientationcycle right center"))

-- False Fullscreen state
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))

-- Toggle off Wacom
hl.bind(mainMod .. " + ALT + 0", hl.dsp.dpms({ action = "toggle", monitor = "HDMI-A-2" }))

hl.bind(mainMod .. " + ALT + 1", hl.dsp.dpms({ action = "toggle", monitor = "DP-3" }))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("sketchlayer"))

hl.bind(
	mainMod .. " + SHIFT + P",
	hl.dsp.exec_cmd("sh -c 'grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%F-%H%M%S).png'")
)

-- Move focus with mainMod + arrow keys

hl.bind(mainMod .. " + " .. "h", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "k", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))

hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))

hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))

hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))

hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))

hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))

hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))

hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))

hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)

hl.bind(mainMod .. " + " .. "D", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "D", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })

-- Requires playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--#############################

--## WINDOWS AND WORKSPACES ###

--#############################

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more

-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

-- Example windowrules that are useful

hl.window_rule({
	name = "suppress-maximize-events",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run windowrule

hl.window_rule({
	name = "move-hyprland-run",
	match = {
		class = "hyprland-run",
	},
	move = { 20, "monitor_h-120" },
	float = true,
})

-- windowrule {

--     name = default-1440p

--     match:class = .*

--     pseudo = false

--     # size = 1920 1080

--     size = 2560 1440

-- }

-- 1. Target specific apps for the large 1440p size (Replace kitty/dolphin with your preferences)

hl.window_rule({
	name = "default-1440p",
	match = {
		class = "^(kitty|dolphin)$",
	},
	pseudo = false,
	size = { 2560, 1440 },
	center = true,
})

-- 2. Force common file dialogues to float and center at a normal size

hl.window_rule({
	name = "center-file-dialogs",
	match = {
		title = "^(Open|Save|Confirm|Choose).*",
	},
	float = true,
	center = true,
	size = { 800, 600 },
})

-- 3. Force system/authentication popups to float and center

hl.window_rule({
	name = "center-polkit",
	match = {
		class = ".*polkit.*",
	},
	float = true,
	center = true,
	size = { 500, 300 },
})

hl.window_rule({
	name = "kitty-magic",
	match = {
		class = "^magic-term$",
	},
	workspace = "special:magic",
	pseudo = true,
	size = { 1800, 1200 },
})

hl.window_rule({
	name = "float-all-godot-debugs",
	match = {
		class = "^(Godot|Sandbox)$",
		title = "^(Sandbox \\(DEBUG\\))$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "float-all-bevy-debugs",
	match = {
		title = "^(topdown|Physics Simulator Shell|Hello World|Fractal Flame Software Renderer)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "float-all-cam",
	match = {
		title = "^(cam)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "float-all-vishape",
	match = {
		title = "^(vishape)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "float-all-pendragon",
	match = {
		title = "^(Pendragon)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "krita-no-decoration",
	match = {
		class = "^krita$",
	},
	border_size = 0,
	rounding = 0,
	decorate = false,
	no_shadow = true,
	-- opacity = 0.5,
})

--###############################
--## STATEFUL FLOATING LOGIC   ##
--###############################

local single_instance_apps = {
	["org.freecad.FreeCAD"] = true,
	["krita"] = true,
}

-- Table to store our internal counts
local app_window_counts = {}

-- Event: Window Opens
hl.on("window.open", function(window)
	if not window or not window.class then
		return
	end

	local class = window.class

	if single_instance_apps[class] then
		-- Increment the count (or initialize to 1 if it doesn't exist yet)
		app_window_counts[class] = (app_window_counts[class] or 0) + 1

		-- If count is greater than 1, it's a popup
		if app_window_counts[class] > 1 then
			hl.exec_cmd("hyprctl dispatch setfloating")
			hl.exec_cmd("hyprctl dispatch centerwindow")
		end
	end
end)

-- Event: Window Closes
hl.on("window.close", function(window)
	if not window or not window.class then
		return
	end

	local class = window.class

	if single_instance_apps[class] then
		-- Decrement the count safely
		if app_window_counts[class] and app_window_counts[class] > 0 then
			app_window_counts[class] = app_window_counts[class] - 1
		end
	end
end)

--################################

--## Autostart ##

--################################

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("[workspace special:magic silent] kitty --class magic-term")
end)
