return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree filesystem reveal float<cr>",
      desc = "Explore NeoTree (Root Dir)",
    },
  },
  opts = {
    close_if_last_window = true,
    window = {
      popup = {
        size = {
          width = "70%",
          height = "80%",
        },
      },
    },
  },
}
