return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" }
    },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = { enabled = true },
    },
  },
  opts_extend = { "sources.default" }
}
