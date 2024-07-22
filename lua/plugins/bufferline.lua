return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true
    require("transparent").clear_prefix("BufferLine")
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

    -- Transparent tab background
    vim.g.transparent_groups = vim.list_extend(
      vim.g.transparent_groups or {},
      vim.tbl_map(function(v)
        return v.hl_group
      end, vim.tbl_values(require("bufferline.config").highlights))
    )
  end,
}
