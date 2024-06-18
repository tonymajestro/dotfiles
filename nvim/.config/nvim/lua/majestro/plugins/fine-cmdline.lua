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

    local open_search_normal = function()
      fine_cmdline.open({ default_value = "/" })
    end

    keymap.set("n", ":", open_normal, {noremap = true})
    keymap.set("n", "/", open_search_normal, {noremap = true})
    keymap.set("v", ":", open_visual, {noremap = true})

    -- Config
    fine_cmdline.setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = ':'
      },
      popup = {
        position = {
          row = '100%',
          col = '50%',
        },
        size = {
          width = "30%"
        }
      }
    })
  end
}
