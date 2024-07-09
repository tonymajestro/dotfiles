return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "pyright",
      "typescript-language-server",
      "bash-language-server",
    },
  },
}
