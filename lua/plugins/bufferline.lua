return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true
    require("bufferline").setup({
      options = {
        hover = {
          enabled = true,
          delay = 50,
          reveal = { "close" },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        diagnostics = "nvim_lsp",
        modified_icon = "●",
        separator_style = "thin",
      },
    })
    vim.keymap.set("n", "<C-i>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<C-o>", ":BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<C-x>", ":BufferLinePickClose<CR>", {})
  end,
}
