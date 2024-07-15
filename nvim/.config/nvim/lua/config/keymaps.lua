-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Cursor movement
map("n", "<C-j>", "2<C-d>", { desc = "Move cursor down 4 lines in normal mode" })
map("n", "<C-k>", "2<C-u>", { desc = "Move cursor up 4 lines in normal mode" })
map("v", "<C-j>", "2<C-d>", { desc = "Move cursor up 4 lines in visual mode" })
map("v", "<C-k>", "2<C-u>", { desc = "Move cursor up 4 lines in visual mode" })
map("i", "<C-a>", "<Home>", { desc = "Move cursor to beginning of line in insert mode " })
map("i", "<C-e>", "<End>", { desc = "Move cursor to end of line in insert mode" })

-- Help commands
map("n", "<leader>h", function()
  local help_term = vim.fn.expand("<cword>")
  vim.cmd.help(help_term)
end, { noremap = true, silent = true, desc = "go to next buffer" })

-- Map tab to escape
vim.api.nvim_set_keymap("i", "kj", "<Esc>", {})

-- Don't remain in visual mremainode when shifting text
map("v", ">", ">", {})
map("v", "<", "<", {})
