return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      configure = false,
    },
    scroll = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>fe",
      "<cmd>lua Snacks.explorer()<cr>",
      desc = "Open snacks explorer",
    },
  },
}
