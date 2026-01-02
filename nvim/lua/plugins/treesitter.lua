return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- Configure wanted lagnuages here
      ensure_installed = {"lua", "go", "rust", "toml", "c", "c_sharp", "typescript", "javascript"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
