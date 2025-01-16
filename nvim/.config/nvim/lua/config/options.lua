-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true

opt.background = "dark"
opt.signcolumn = "yes"
opt.pumblend = 0

opt.backspace = "indent,eol,start"

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.timeoutlen = 1000
opt.ttimeoutlen = 0

-- Remove tab hints
opt.list = false

vim.o.shell = "fish"
vim.g.snacks_animate = false
