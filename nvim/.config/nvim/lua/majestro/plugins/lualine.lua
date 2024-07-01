return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin'
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'filename'},
      lualine_c = {},
      lualine_x = {'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  }
}


