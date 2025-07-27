return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      configure = false,
    },
    scroll = {
      enabled = false,
    },
    explorer = {
      follow_file = true,
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>lua Snacks.explorer()<cr>",
      desc = "Open snacks explorer",
    },
  },
}
