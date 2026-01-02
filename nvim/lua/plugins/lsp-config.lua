return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason.nvim", "cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Define on_attach function
      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      -- Base config for most servers
      local base_config = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Configure LSP servers using vim.lsp.config
      vim.lsp.config("lua_ls", base_config)
      vim.lsp.config("ts_ls", base_config)
      vim.lsp.config("gopls", base_config)
      vim.lsp.config("clangd", base_config)
      vim.lsp.config("gleam", base_config)
      vim.lsp.config("rust_analyzer", base_config)

      vim.lsp.config(
        "csharp_ls",
        vim.tbl_extend("force", base_config, {
          cmd = { vim.fn.stdpath("data") .. "/mason/bin/csharp-ls" },
          cmd_env = {
            DOTNET_ROOT = "/usr/lib64/dotnet",
          },
          init_options = {
            AutomaticWorkspaceInit = true,
          },
        })
      )

      -- Enable all configured servers
      vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "clangd", "gleam", "rust_analyzer", "csharp_ls" })
    end,
  },
}
