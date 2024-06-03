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
          text="nvim-tree",
          separator= true,
        }
      },
      separator_style = "slant"
    }
  }
}
