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

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufopts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, bufopts)
        end,
      })

      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("csharp_ls", {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/csharp-ls" },
        cmd_env = {
          DOTNET_ROOT = "/opt/homebrew/bin/dotnet",
        },
        init_options = {
          AutomaticWorkspaceInit = true,
        },
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "clangd", "gleam", "rust_analyzer", "csharp_ls" })
    end,
  },
}
