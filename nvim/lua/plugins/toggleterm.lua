return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      size = 15,
      shade_terminals = false,
      float_opts = { border = "curved" },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local float = Terminal:new({ direction = "float", hidden = true })
    vim.keymap.set("n", "<leader>tf", function() float:toggle() end, { desc = "Toggle floating terminal" })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<CR>", { desc = "Toggle vertical terminal" })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function(args)
        local o = { buffer = args.buf }
        vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], o)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
      end,
    })
  end,
}
