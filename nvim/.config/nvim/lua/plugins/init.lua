return {
  "tpope/vim-repeat",
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
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
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = false,
      },
    },
  },
}
