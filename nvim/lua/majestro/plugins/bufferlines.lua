return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons" 
  },
  version = "*",
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          highlight = "Directory",
          text="NvimTree",
          separator= true,
        }
      },
      separator_style = "slant"
    }
  }
}
