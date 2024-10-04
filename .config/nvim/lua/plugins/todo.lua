return {

	{
		"saltchicken/todo-tui",
		config = function()
			local todo = require("todo-tui")
			todo.setup({
				debug = true,
			})
		end,
	},
}
