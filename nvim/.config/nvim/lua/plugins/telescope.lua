return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")

    return {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close, -- close Telescope window with escape
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-p>"] = layout.toggle_preview,
            ["<c-d>"] = actions.delete_buffer,
          },
        },
        path_display = { "smart" },
      },
    }
  end,
  keys = {
    { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "Telescope git status" },
  },
}
