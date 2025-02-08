return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				-- Install the following lsp servers for different languages
				-- (commented out rn, should just auto install for each language.
				--ensure_installed = { "lua_ls", "tsserver", "gopls" },
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
      local path_to_elixirls = vim.fn.expand("~/.local/share/nvim/mason/packages/elixir-ls/release/language_server.sh")
			-- Config to setup the lsps
			-- Need to set capabilities in order for cmp_nvim_lsp to work
			-- TODO: Reconfig this so I don't need to call "setup" on everything I wanna use
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.gleam.setup({
				capabilities = capabilities,
			})
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
			lspconfig.elixirls.setup({
				cmd = { path_to_elixirls },
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					elixirLS = {
						dialyzerEnabled = false,
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
