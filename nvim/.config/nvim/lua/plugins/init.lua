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
      scrolloff_percentage = 0.2,
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  "mfussenegger/nvim-jdtls",
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
}
