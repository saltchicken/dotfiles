return {
	-- Other plugins
	{
		"saltchicken/nvim-ollama-pilot",
		config = function()
			local pilot = require("nvim-ollama-pilot")
			pilot.setup({
				debug = true,
				server_address = "127.0.0.1",
				port = "11434",
			})
		end,
	},
}
