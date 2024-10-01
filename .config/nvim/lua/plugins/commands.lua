return {
	vim.api.nvim_create_user_command("W", function()
		vim.cmd("SudaWrite")
	end, {}),

	-- vim.cmd('command! -nargs=0 w!! execute "Ww"'),
}
