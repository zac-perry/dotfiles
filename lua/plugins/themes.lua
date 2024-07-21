return {
	--[[{
		"shaunsingh/nord.nvim",
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},--]]
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
