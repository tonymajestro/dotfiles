return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "vimls",
      "fish_lsp",
      "bashls",
      "ts_ls",
      "jdtls",
      "cssls",
      "lemminx",
      "ruby_lsp",
      "eslint",
      "gopls",
      "html",
      "just",
      "pyright",
      "ruff",
      "yamlls"
    },
    automatic_enable = {
      exclude = { "jdtls" }
    }
  }
}
