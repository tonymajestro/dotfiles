return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  version = '*',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        separator_style = 'slant',
        style_preset = bufferline.style_preset.no_italic
      },
    })
  end
}
