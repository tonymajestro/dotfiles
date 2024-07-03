return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
      ["<esc>"] = actions.close, -- close Telescope window with escape
      ["<C-k>"] = actions.move_selection_previous, -- move to prev result
      ["<C-j>"] = actions.move_selection_next, -- move to next result
    })
  end,
  keys = {
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      { desc = "Fuzzy find help tags" },
    },
  },
}
