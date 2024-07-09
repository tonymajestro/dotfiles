return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
      ["<esc>"] = actions.close, -- close Telescope window with escape
      ["<C-k>"] = actions.move_selection_previous, -- move to prev result
      ["<C-j>"] = actions.move_selection_next, -- move to next result
      ["<C-p>"] = layout.toggle_preview,
    })

    opts.defaults.path_display = { "smart" }
  end,
  keys = {
    { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "Telescope git status" },
  },
}
