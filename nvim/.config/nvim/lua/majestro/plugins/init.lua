return {
  'nvim-lua/plenary.nvim',
  'farmergreg/vim-lastplace',
  'tpope/vim-sleuth',
  'tpope/vim-repeat',
  'famiu/bufdelete.nvim',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd('colorscheme catppuccin')
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    enabled = true
  },
  {
    'jinh0/eyeliner.nvim',
    opts = {
      highlight_on_key = true,
      dim = true
    }
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {}
  }
}
