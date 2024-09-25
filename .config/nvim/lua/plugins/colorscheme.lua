-- local util = require("solarized-osaka.util")
-- local hslutil = require("solarized-osaka.hsl")
-- local hsl = hslutil.hslToHex

return {
	{
		"saltchicken/solarized-matrix",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				style = "night",
			}
		end,
	},
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			transparent = true,
	-- 			---@param colors string
	-- 			on_colors = function(colors)
	-- 				-- colors.todo = colors.green500
	-- 				colors.info = colors.green500 -- This somehow affects TODO
	-- 				-- colors.base0 = colors.violet
	-- 				-- colors.WarningMsg = { fg = colors.green500, bold = true }
	-- 				-- colors.Debug = { fg = colors.green500 }
	--
	-- 				-- local new_orange = "#00FF00"
	-- 				local new_orange = colors.cyan700
	-- 				colors.orange = new_orange
	-- 				colors.orange100 = new_orange
	-- 				colors.orange300 = new_orange
	-- 				colors.orange500 = new_orange
	-- 				colors.orange700 = new_orange
	-- 				colors.orange900 = new_orange
	-- 			end,
	-- 			-- on_highlights = function(highlights, colors)
	-- 			-- 	highlights.todo = colors.green500
	-- 			-- end,
	-- 		}
	-- 	end,
	-- },
}
