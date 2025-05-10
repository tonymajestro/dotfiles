-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Cursor movement
map("n", "<C-j>", "4j", { desc = "Move cursor down 4 lines in normal mode" })
map("n", "<C-k>", "4k", { desc = "Move cursor up 4 lines in normal mode" })
map("v", "<C-j>", "4j", { desc = "Move cursor up 4 lines in visual mode" })
map("v", "<C-k>", "4k", { desc = "Move cursor up 4 lines in visual mode" })
map("i", "<C-a>", "<Home>", { desc = "Move cursor to beginning of line in insert mode " })
map("i", "<C-e>", "<End>", { desc = "Move cursor to end of line in insert mode" })

-- Navigate tabs
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")

-- Map kj to escape
vim.api.nvim_set_keymap("i", "kj", "<Esc>", {})

-- Don't remain in visual mode when shifting text
map("v", ">", ">", {})
map("v", "<", "<", {})

-- Visual repeat
map("v", ".", ":normal .<cr>")

-- Open diagnostics in floating window
map("n", "<leader>K", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostics in floating window" })

-- Ignore q:
map("n", "q:", "<nop>", { noremap = true })

-- Close buffers
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the left" })
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the right" })

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>wa", "<cmd>wa<cr>")
map("n", "<leader>wq", "<cmd>wq<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>qa", "<cmd>qa<cr>")

-- Visual line
map("n", "vv", "V")

-- Open command
map("n", "<leader>cc", "<Cmd>")

-- GPT stuff
map("n", "<leader>a", "ggVG<cmd>'<,'>!aichat -c<cr>")
map("v", "<leader>a", "<cmd>'<,'>!aichat -c<cr>")

-- Toggle syntax highlighting
map("n", "<leader>uh", function()
  local syntax_enabled = vim.g.syntax_on ~= nil

  -- toggle nvim syntax highlighting
  if syntax_enabled then
    vim.api.nvim_command("syntax off")
  else
    vim.api.nvim_command("syntax on")
  end

  -- toggle treesitter syntax highlighting
  vim.api.nvim_command("TSBufToggle highlight")
end, { desc = "Toggle syntax highlighting" })
