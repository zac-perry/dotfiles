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
    
    -- Target the actual tabline area
    local function make_tabline_transparent()
      -- These control the actual line/area where bufferline sits
      vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
      
      -- Also clear any bufferline backgrounds just in case
      local groups_to_clear = {
        "BufferLineFill",
        "BufferLineBackground", 
        "BufferLineTab",
        "BufferLineTabSelected",
        "BufferLineBuffer",
        "BufferLineBufferSelected",
        "BufferLineBufferVisible",
      }
      
      for _, group in ipairs(groups_to_clear) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl then
          hl.bg = nil
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
    end
    
    -- Apply immediately and on colorscheme changes
    vim.schedule(make_tabline_transparent)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.schedule(make_tabline_transparent)
      end,
    })
    
    vim.keymap.set("n", "<C-i>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<C-o>", ":BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<C-x>", ":BufferLinePickClose<CR>", {})
  end,
}
