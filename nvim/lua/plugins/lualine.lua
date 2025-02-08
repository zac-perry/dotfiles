return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				--theme = "catppuccin",
				--       theme = "nord",
				--        theme = "nordic"
				--theme = "rose-pine",
        theme = "evergarden",
			},
		})
	end,
}
