vim.g.mapleader = " "

local keymap = vim.keymap

-- Cursor movement
keymap.set("n", "<C-j>", "4<C-d>", { desc = "Move cursor down 4 lines in normal mode" })
keymap.set("n", "<C-k>", "4<C-u>", { desc = "Move cursor up 4 lines in normal mode" })
keymap.set("v", "<C-j>", "4<C-d>", { desc = "Move cursor up 4 lines in visual mode" })
keymap.set("v", "<C-k>", "4<C-u>", { desc = "Move cursor up 4 lines in visual mode" })

-- Clear search results
keymap.set("n", "<C-l>", ":noh<cr>", { desc = "Clear search results" })

-- Window management
keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sn", "<C-w><C-w>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer management
keymap.set("n", "<leader>bj", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
keymap.set("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
keymap.set("n", "<leader>bk", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Go to prev buffer" })
keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Go to prev buffer" })
keymap.set("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Go to prev buffer" })
keymap.set("n", "<leader>bd", "<cmd>Bdelete<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })
