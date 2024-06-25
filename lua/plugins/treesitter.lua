return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- Configure wanted lagnuages here
      ensure_installed = {"lua", "go", "c", "javascript"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end


}
