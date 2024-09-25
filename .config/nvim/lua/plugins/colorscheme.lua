return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				on_colors = function(colors)
					-- colors.todo = colors.green500
					colors.info = colors.green500 -- This somehow affects TODO
				end,
				-- on_highlights = function(highlights, colors)
				-- 	highlights.todo = colors.green500
				-- end,
			}
		end,
	},
}
