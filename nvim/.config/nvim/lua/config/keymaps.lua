-- cursor movement
vim.keymap.set("n", "<C-j>", "4j", { desc = "Move cursor down 4 lines in normal mode" })
vim.keymap.set("n", "<C-k>", "4k", { desc = "Move cursor up 4 lines in normal mode" })
vim.keymap.set("v", "<C-j>", "4j", { desc = "Move cursor up 4 lines in visual mode" })
vim.keymap.set("v", "<C-k>", "4k", { desc = "Move cursor up 4 lines in visual mode" })
vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Move cursor to beginning of line in insert mode " })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Move cursor to end of line in insert mode" })

-- map kj to escape
vim.keymap.set("i", "kj", "<esc>")

-- visual repeat
vim.keymap.set("v", ".", ":normal .<cr>")

-- ignore q:
vim.keymap.set("n", "q:", "<NOP>", { noremap = true, silent = true, desc = "Command history" })

-- visual line
vim.keymap.set("n", "vv", "V")

-- buffer and windows
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write buffers" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- oil
vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "Open [O]il.nvim" })

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open [L]azy.nvim" })

-- mason
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Open [M]ason.nvim" })

-- clear highlight on escape
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")

-- toggle qflist
vim.keymap.set("n", "<leader>cl",
  function()
    if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
      vim.cmd("cclose")
    else
      vim.cmd("copen")
    end
  end,
  { desc = "Open diagnostic quickfix list" })
