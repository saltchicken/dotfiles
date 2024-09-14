return {
	-- Other plugins
	{
		"saltchicken/example_plugin",
		config = function()
			require("example_plugin")
			print("hello there")
		end,
	},
}
