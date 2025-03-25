return {
	"nvim-lualine/lualine.nvim",
  disabled = true,

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
