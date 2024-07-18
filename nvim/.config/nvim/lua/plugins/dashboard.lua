return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New File",
          key = "n",
        },
        {
          action = "Neotree",
          desc = " File Explorer",
          key = "e",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          key = "s",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          key = "l",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          key = "q",
        },
      },
      header = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "Neovim",
        "",
        "",
      },
      footer = {},
    },
  },
}
