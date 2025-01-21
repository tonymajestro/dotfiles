return {
  "folke/trouble.nvim",
  opts = {
    auto_jump = true,
    focus = true,
    auto_preview = false,
    keys = {
      ["<cr>"] = "jump_close",
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
}
