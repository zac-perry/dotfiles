return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			-- Call setup first to initialize properly
			require("transparent").setup({
				enable = true,
			})

			-- Then clear the prefixes
			require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("BufferLine")
			require("transparent").clear_prefix("TabLine")
		end,
	},
}
