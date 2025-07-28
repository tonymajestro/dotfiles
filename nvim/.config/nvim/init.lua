--
-- Options
--
vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.winborder = "rounded"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.timeoutlen = 500
vim.diagnostic.config({ virtual_text = true })


--
-- Keymaps
--
vim.keymap.set("i", "kj", "<Esc>", { desc = "Visual block mode" })
vim.keymap.set({"n", "v"}, "<C-j>", "4<C-d>", { desc = "Scroll down 4 lines" })
vim.keymap.set({"n", "v"}, "<C-k>", "4<C-u>", { desc = "Scroll up 4 lines" })
vim.keymap.set("n", "vv", "V", { desc = "Visual block mode" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit current buffer" })
vim.keymap.set({"n", "v"}, "<Esc>", "<Esc><cmd>noh<CR>")
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<CR>")

--
-- Autocommands
--

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    -- The " mark stores last position of cursor on exit
    local last_pos = vim.api.nvim_buf_get_mark(event.buf, '"')
    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end
})

--
-- Lazy
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "vague2k/vague.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("vague").setup({
          italic = false,
        })

        vim.cmd("colorscheme vague")
      end,
    },
    "neovim/nvim-lspconfig",
    {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
        require("mini.pairs").setup({})
        require("mini.ai").setup({})
        require("mini.files").setup({})
        require("mini.pick").setup({})
      end,
    },
  },
  install = { colorscheme = { "vague" } },
  checker = { enabled = true },
})

--
-- LSP
--
vim.lsp.enable("lua_ls")
vim.lsp.config["lua_ls"] = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
    },
  },
}
