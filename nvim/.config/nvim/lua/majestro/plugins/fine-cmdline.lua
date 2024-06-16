return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    local fine_cmdline = require("fine-cmdline")
    local keymap = vim.keymap

    -- Keymaps
    local open_normal = function()
      fine_cmdline.open({ default_value = "" })
    end

    local open_visual = function()
      fine_cmdline.open({ default_value = "'<,'>" })
    end

    keymap.set("n", ":", open_normal, {noremap = true})
    keymap.set("v", ":", open_visual, {noremap = true})

    -- Config
    fine_cmdline.setup({
      popup = {
        size = {
          width = "40%"
        }
      }
    })
  end
}
