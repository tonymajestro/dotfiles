local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q_2"),
  pattern = {
    "git",
    "fugitiveblame",
    "trouble",
    "qf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_esc"),
  pattern = {
    "git",
    "fugitiveblame",
    "trouble",
    "help",
    "qf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<esc>", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("autoclose_qflist"),
  pattern = { "qf" },
  callback = function(event)
    vim.keymap.set("n", "<cr>", "<cr>:cclose<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})
