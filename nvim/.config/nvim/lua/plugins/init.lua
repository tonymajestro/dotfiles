return {
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "tonymajestro/smart-scrolloff.nvim",
    opts = {
      scrolloff_percentage = 0.27,
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      local theme = vim.env.NVIM_THEME
      if theme == nil or theme == "" then
        theme = "catppuccin-latte"
      end

      return {
        colorscheme = theme,
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
  },
  {
    "opdavies/toggle-checkbox.nvim",
    keys = {
      {
        "<leader>cc",
        function()
          require("toggle-checkbox").toggle()
        end,
        desc = "Toggle checkbox",
        mode = { "n", "v" },
        ft = "markdown",
      },
    },
  },
}
