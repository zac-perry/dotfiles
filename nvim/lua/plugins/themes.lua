return {
	{
		"comfysage/evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			transparent_background = true,
			variant = "hard", -- 'hard'|'medium'|'soft'
			overrides = {}, -- add custom overrides
		},
    config = function()
      require("evergarden").setup({
        telescope = true,
      })
      vim.cmd("colorscheme evergarden")
    end
	},
	--[[{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				extend_background_behind_borders = true,
				enable = {
					migrations = true,
					legacy_highlights = true,
				},
				styles = {
          italic = false,
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},--]]
	--[[	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = true
			vim.g.nord_bold = false
			vim.cmd("colorscheme nord")
		end,
	},--]]
	--[[	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").load("wave")
		end,
	},--]]
	--[[{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},--]]
	--[[{
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
          italic_comments = true,
          bright_border = true,
          transparent_bg = true,
          telescope = { style = 'classic',},
        })
        require('nordic').load()
    end
}--]]
}
