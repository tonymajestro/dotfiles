return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      theme = "catppuccin",
      globalstatus = vim.o.laststatus == 2,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
  },
}
