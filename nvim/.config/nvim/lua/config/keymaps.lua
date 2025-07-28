vim.keymap.set("i", "kj", "<Esc>", { desc = "Visual block mode" })

vim.keymap.set({ "n", "v" }, "<C-j>", "4<C-d>", { desc = "Scroll down 4 lines" })
vim.keymap.set({ "n", "v" }, "<C-k>", "4<C-u>", { desc = "Scroll up 4 lines" })

vim.keymap.set("n", "vv", "V", { desc = "Visual block mode" })

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit current buffer" })

vim.keymap.set({ "n", "v" }, "<Esc>", "<Esc><cmd>noh<CR>")

-- Disable q:
vim.keymap.set("n", "q:", "<nop>")

-- Mini.files/Mini.pick
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "File explorer" })
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<CR>", { desc = "Search help" })
vim.keymap.set("n", "<leader>s", "<cmd>Pick grep_live<CR>", { desc = "Search (live grep)" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<CR>", { desc = "Find files" })
vim.keymap.set({ "n", "v" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format file" })
