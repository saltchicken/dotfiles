-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.laststatus = 0

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = "*",
--   callback = function()
--     vim.opt_local.mouse = ""
--   end,
-- })

vim.filetype.add({
	extension = {
		wgsl = "wgsl",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "wgsl",
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tidal",
	callback = function()
		vim.bo.commentstring = "-- %s"
	end,
})
