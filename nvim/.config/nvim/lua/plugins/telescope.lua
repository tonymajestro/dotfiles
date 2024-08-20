return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close, -- close Telescope window with escape
            ["<c-d>"] = actions.delete_buffer,
          },
        },
        path_display = { "smart" },
      },
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type",
            "f",
            "--color=never",
            "--hidden",
            "--follow",
            "-E",
            ".git/*",
          },
        },
      },
    }
  end,
  keys = {
    { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "Telescope git status" },
    {
      "<leader><space>",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Telescope open buffers",
    },
  },
}
