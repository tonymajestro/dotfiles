return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  version = "*",
  opts = {
    options = {
      separator_style = "slant",
    },
  },
  config = function(_, opts)
    local bufferline = require('bufferline')
    opts.options.style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    }
    bufferline.setup(opts)
  end
}
