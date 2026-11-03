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

-- Quality of life options
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true

-- Move selected lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
-- Keep selection after indenting
vim.keymap.set('v', '<', '<gv', { desc = "Indent left, keep selection" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent right, keep selection" })
-- Keep search results centered
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Next match, centered" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Prev match, centered" })
-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlight" })
-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Window left" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Window down" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Window up" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Window right" })
-- Paste over selection without overwriting the register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = "Paste without yanking selection" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
