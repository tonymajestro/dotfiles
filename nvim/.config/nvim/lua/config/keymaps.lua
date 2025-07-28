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

vim.keymap.set("n", "H", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format file" })

-- Lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Move line
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Delete Buffer" })
