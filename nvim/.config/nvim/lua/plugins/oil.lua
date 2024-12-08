return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
      ["<BS>"] = { "actions.parent", mode = "n" },
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      "<leader>e",
      function()
        require("oil").open()
      end,
      desc = "Open oil",
    },
  },
}
