if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	if ... then
		require("util.debug").dump(...)
	end
end
vim.print = _G.dd

require("config.lazy")

-- Disable cursorline. :set nocursorline
vim.wo.cursorline = false
