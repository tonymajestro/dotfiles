-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- ignore case
vim.o.ignorecase = true
vim.o.smartcase = true

-- spaces and indenting
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.smartindent = true

-- looks
vim.o.background = "dark"
vim.o.signcolumn = "yes"
vim.opt.inccommand = "nosplit" -- preview incremental substitution

-- enable mouse
vim.o.mouse = 'a'

-- use system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- diagnostics
vim.diagnostic.config({ virtual_text = true })

-- misc
vim.o.jumpoptions = "view"
vim.o.scrolloff = math.floor(vim.o.lines * 0.25)
vim.o.grepprg = "rg --vimgrep"
vim.o.winborder = "rounded"
vim.o.shell = "fish"
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 250
vim.o.wrap = false
vim.o.showmode = false -- don't need mode since it's present in status line
vim.o.confirm = true
