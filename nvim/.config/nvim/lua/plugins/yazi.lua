return {
  "mikavilpas/yazi.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = {
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
  },
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 0.8,
  },
}
