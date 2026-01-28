-- save_ab_clip_combined.lua
-- Press Ctrl+s to save current A-B loop (Video)
-- Press Ctrl+Shift+s to save current A-B loop (Audio Only)

local utils = require("mp.utils")
local msg = require("mp.msg")

local home = os.getenv("HOME")
local video_dir = home .. "/Videos/loops/"
local audio_dir = home .. "/Music/loops/"
os.execute("mkdir -p " .. video_dir)
os.execute("mkdir -p " .. audio_dir)

-- Format time as hh-mm-ss
local function format_time(seconds)
	local h = math.floor(seconds / 3600)
	local m = math.floor((seconds % 3600) / 60)
	local s = math.floor(seconds % 60)
	return string.format("%02d-%02d-%02d", h, m, s)
end

-- Get current A-B loop range
local function get_ab_range()
	local a = mp.get_property_number("ab-loop-a")
	local b = mp.get_property_number("ab-loop-b")
	if a and b then
		return a, b
	else
		mp.osd_message("No A-B loop set!")
		return nil
	end
end

local function save_loop(is_audio)
	local a, b = get_ab_range()
	if not a then
		return
	end

	local duration = b - a
	local file = mp.get_property("path")
	local filename = file:match("^.+/(.+)$") or file
	local basename = filename:gsub("(.+)%..+$", "%1")
	local start_str = format_time(a)

	-- ‼️ Determine extension, directory, and label based on mode
	local ext = is_audio and "mp3" or "mp4"
	local type_label = is_audio and "Audio" or "Clip"
	local suffix = is_audio and "_audio_" or "_ab_"
	local output_dir = is_audio and audio_dir or video_dir

	local output = string.format("%s%s%s%s.%s", output_dir, basename, suffix, start_str, ext)

	mp.osd_message("Saving " .. type_label .. " loop...")
	os.execute('notify-send "Saving ' .. type_label .. ' loop"')

	-- Base ffmpeg arguments
	local args = {
		"ffmpeg",
		"-ss",
		tostring(a),
		"-i",
		file,
		"-t",
		tostring(duration),
	}

	-- ‼️ Branching logic for codec selection
	if is_audio then
		-- Audio Only: No video, encode to MP3 (VBR quality 2)
		table.insert(args, "-vn")
		table.insert(args, "-c:a")
		table.insert(args, "libmp3lame")
		table.insert(args, "-q:a")
		table.insert(args, "2")
	else
		-- Video Clip: Original encoding settings
		table.insert(args, "-c:v")
		table.insert(args, "libx264")
		table.insert(args, "-preset")
		table.insert(args, "fast")
		table.insert(args, "-c:a")
		table.insert(args, "aac")
	end

	table.insert(args, "-y")
	table.insert(args, output)

	local res = utils.subprocess({ args = args, cancellable = false })

	if res.status == 0 then
		mp.osd_message("Saved " .. type_label .. " to " .. output)
		os.execute('notify-send "Saved ' .. type_label .. " to " .. output .. '"')
	else
		mp.osd_message("Failed to save! See console.")
		os.execute('notify-send "Failed to save! See console."')
		msg.error(res.error)
	end
end

local function save_video_clip()
	save_loop(false)
end

local function save_audio_clip()
	save_loop(true)
end

-- Key bindings
mp.add_key_binding("Ctrl+s", save_video_clip)
mp.add_key_binding("Ctrl+Shift+s", save_audio_clip)
