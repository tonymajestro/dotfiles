return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "mocha",
        },
        no_italic = true,
        auto_integrations = true
      })

      vim.cmd([[colorscheme catppuccin]])
    end
  },
}
