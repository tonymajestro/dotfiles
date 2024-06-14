return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = 'center',

        sorting_strategy='ascending',
        preview = {
          hide_on_startup = true
        },
        path_display = {
          "smart"
        },
        layout_config = {
          width = 0.8,
          height = 0.8,
          center = {
            preview_cutoff = 0,
          },
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close, -- close Telescope window with escape
            ['<C-p>'] = layout.toggle_preview, -- toggle preview
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          --theme = "dropdown"
        },
        buffers = {
          sort_lastused = true,
          --theme = "dropdown"
        },
        git_status = {
          --theme = "dropdown"
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set("n", "<leader>fo", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find open buffers" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy find open buffers" })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Fuzzy find in help tags"})
  end
}

