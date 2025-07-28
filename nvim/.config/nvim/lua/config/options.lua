vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true

vim.o.cursorline = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.breakindent = true

vim.o.clipboard = "unnamedplus"

vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.undofile = true
vim.o.scrolloff = 10

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.o.showmode = false

vim.diagnostic.config({
  virtual_text = true
})
