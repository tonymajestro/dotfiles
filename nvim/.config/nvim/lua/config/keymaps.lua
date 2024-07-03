-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { silent = true })

-- Cursor movement
vim.keymap.set("n", "<C-j>", "2<C-d>", { desc = "Move cursor down 4 lines in normal mode" })
vim.keymap.set("n", "<C-k>", "2<C-u>", { desc = "Move cursor up 4 lines in normal mode" })
vim.keymap.set("v", "<C-j>", "2<C-d>", { desc = "Move cursor up 4 lines in visual mode" })
vim.keymap.set("v", "<C-k>", "2<C-u>", { desc = "Move cursor up 4 lines in visual mode" })

-- Help commands
vim.keymap.set("n", "<leader>H", function()
  local help_term = vim.fn.expand("<cword>")
  vim.cmd.help(help_term)
end, { noremap = true, silent = true, desc = "Go to next buffer" })
