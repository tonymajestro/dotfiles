vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities()
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'Snacks' }, -- Recognize 'vim' as a global variable
      },
    },
  },
})
