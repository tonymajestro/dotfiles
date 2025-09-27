return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = { enabled = false },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = true,
        auto_show_delay_ms = 300,
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
        show_without_menu = false,
      },
    },
    keymap = {
      preset = "enter",
      ["<C-n>"] = {
        "show",
        function(cmp)
          cmp.select_next({ auto_insert = false })
        end
      }
    },
  },
  opts_extend = { "sources.default" }
}
