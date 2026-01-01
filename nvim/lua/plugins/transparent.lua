return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
			},
			extra_groups = {
				-- Add these tabline groups
				"TabLine",
				"TabLineFill",
				"TabLineSel",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineTab",
				"BufferLineTabSelected",
				"BufferLineDevIcon.*", -- Pattern for all icon groups
				"BufferLineBufferIcon",
			},
			exclude_groups = {},
		})
	end,
}
