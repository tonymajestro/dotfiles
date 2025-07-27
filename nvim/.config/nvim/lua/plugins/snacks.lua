return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      configure = false,
    },
    scroll = {
      enabled = false,
    },
    picker = {
      sources = {
        explorer = {
          follow_file = true,
          tree = true,
          auto_close = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
  },
}
