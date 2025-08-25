return {
  {
    'echasnovski/mini.tabline',
    version = '*',
    config = function()
      require("mini.tabline").setup({
        show_icons = false
      })

      local colors = require("catppuccin.palettes.macchiato")
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
        fg = colors.text,
        bg = colors.base,
        sp = colors.red,
        bold = true,
        underline = true,
      })
      vim.api.nvim_set_hl(0, "MiniTablineHidden", {
        fg = colors.overlay1,
        bg = colors.crust
      })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", {
        fg = colors.red,
        bg = colors.base,
        sp = colors.red,
        bold = true,
        underline = true,
      })

    end
  },
}
