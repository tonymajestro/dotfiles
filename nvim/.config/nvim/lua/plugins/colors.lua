local theme = vim.env.NVIM_THEME
if theme == nil or theme == "" then
  theme = "catppuccin-latte"
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = theme,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = theme,
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
  },
}
