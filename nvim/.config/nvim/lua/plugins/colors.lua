return {
  "f-person/auto-dark-mode.nvim",
  opts = function()
    local lualine = require("lualine")

    local function setColors(mode, theme)
      vim.api.nvim_set_option_value("background", mode, {})
      vim.cmd("colorscheme " .. theme)
      lualine.setup({
        options = {
          theme = theme,
        },
      })
    end

    return {
      update_interval = 5000,
      set_dark_mode = function()
        setColors("dark", "catppuccin-mocha")
      end,
      set_light_mode = function()
        setColors("light", "catppuccin-latte")
      end,
    }
  end,
}
