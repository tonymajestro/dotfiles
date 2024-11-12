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
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
