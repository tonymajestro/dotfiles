return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.icons").setup({})
    require("mini.pairs").setup({})
    require("mini.ai").setup({})
    require("mini.files").setup({})
    require("mini.pick").setup({})
    require("mini.tabline").setup({})

    local statusline = require("mini.statusline")
    statusline.setup({})
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
