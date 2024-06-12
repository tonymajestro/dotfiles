vim.cmd("let g:netrw_liststyle = 3")
vim.g.tmux_navigator_disable_netrw_workaround = 1

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs and indention
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- don't wrap text
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- term settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- use system clipboard 
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
