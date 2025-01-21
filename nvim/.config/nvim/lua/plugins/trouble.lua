return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
}
