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
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      sync_install = false,
      ignore_install = {},
      auto_install = false,
      highlight = {
        enable = true
      },
      modules = {},
      indent = {
        enable = false
      },
      autotag = {
        enable = true
      },
      ensure_installed = {
        "json",
        "go",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end
}
