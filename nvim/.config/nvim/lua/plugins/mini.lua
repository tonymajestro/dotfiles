return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.pairs").setup({})
    require("mini.ai").setup({})
    require("mini.files").setup({})
    require("mini.pick").setup({})
  end,
}
