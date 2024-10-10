return {

	{
		"saltchicken/todo-tui",
		dependencies = {
			"saltchicken/windows.nvim",
		},
		config = function()
			local todo = require("todo-tui")
			todo.setup({
				debug = true,
				repo_path = "/home/saltchicken/.local/share/keep",
			})
		end,
	},
}
