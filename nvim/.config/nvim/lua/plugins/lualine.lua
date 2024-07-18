return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin-macchiato",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
