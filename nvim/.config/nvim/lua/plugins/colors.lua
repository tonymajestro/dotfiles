return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "macchiato",
        },
        no_italic = true,
        integrations = { blink_cmp = true },
      })

      vim.cmd([[colorscheme catppuccin]])
    end
  },
}
