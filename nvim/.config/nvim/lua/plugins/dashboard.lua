local function getHeader()
  local header = {}

  local lines = 18
  local left = vim.o.lines - lines
  local whitespaceLines = left / 2

  for _ = 1, whitespaceLines do
    table.insert(header, "")
  end
  table.insert(header, "Neovim")
  table.insert(header, "")

  return header
end

local function getCenter()
  return {
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
  }
end

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      header = getHeader(),
      center = getCenter(),
    },
  },
}
