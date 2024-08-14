return {
  "debugloop/telescope-undo.nvim",
  dependencies = { -- note how they're inverted to above example
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    {
      "<leader>uu",
      "<cmd>Telescope undo<cr>",
      desc = "undo history",
    },
  },
  opts = function()
    return {
      extensions = {
        undo = {
          use_delta = false,
          vim_diff_opts = {
            ctxlen = vim.o.scrolloff,
          },
          layout_config = {
            preview_width = 0.7,
            preview_cutoff = 0,
            width = 0.99,
            height = 0.99,
          },
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
            n = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    -- defaults, as well as each extension).
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
