return {
  {
    'echasnovski/mini.ai',
    version = '*',
    config = function()

      -- https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/util/mini.lua#L5
      local function ai_buffer(ai_type)
        local start_line, end_line = 1, vim.fn.line("$")
        if ai_type == "i" then
          -- Skip first and last blank lines for `i` textobject
          local first_nonblank, last_nonblank = vim.fn.nextnonblank(start_line), vim.fn.prevnonblank(end_line)
          -- Do nothing for buffer with all blanks
          if first_nonblank == 0 or last_nonblank == 0 then
            return { from = { line = start_line, col = 1 } }
          end
          start_line, end_line = first_nonblank, last_nonblank
        end

        local to_col = math.max(vim.fn.getline(end_line):len(), 1)
        return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
      end

      require('mini.ai').setup({
        custom_textobjects = {
          g = ai_buffer
        }
      })
    end
  },
  {
    'echasnovski/mini.tabline',
    version = '*',
    config = function()
      require("mini.tabline").setup({
        show_icons = false
      })

      local colors = require("catppuccin.palettes.macchiato")

      -- current tab
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
        fg = colors.text,
        bg = colors.base,
        sp = colors.red,
        bold = true,
        underline = true,
      })

      -- current tab modified
      vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", {
        fg = colors.red,
        bg = colors.base,
        sp = colors.red,
        bold = true,
        underline = true,
      })

      -- other tabs
      vim.api.nvim_set_hl(0, "MiniTablineHidden", {
        fg = colors.overlay1,
        bg = colors.crust
      })

      -- other tabs modified
      vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", {
        fg = colors.red,
        bg = colors.crust,
      })

    end
  },
}
