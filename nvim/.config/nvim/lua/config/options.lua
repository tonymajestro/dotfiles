vim.o.number = true
vim.o.relativenumber = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.background = "dark"
vim.o.signcolumn = "yes"
vim.o.pumblend = 0

vim.opt.backspace = { "indent", "eol", "start" }

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Remove tab hints
vim.o.list = false

vim.o.shell = "fish"
vim.g.snacks_animate = false

vim.o.winborder = "rounded"
