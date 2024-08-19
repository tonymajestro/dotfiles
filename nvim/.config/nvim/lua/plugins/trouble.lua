return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics focus=true toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>k",
      vim.diagnostic.open_float,
      desc = "Open lsp diagnostics in floating window",
    },
  },
  opts = {
    keys = {
      ["<esc>"] = "close",
    },
  },
}
