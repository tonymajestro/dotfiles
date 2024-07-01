return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    auto_tag = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end
}
