vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- You can use any character
    format = function(diagnostic)
      -- Truncate long messages
      local message = diagnostic.message
      if #message > 50 then
        return message:sub(1, 47) .. "..."
      end
      return message
    end,
  },
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
