return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-n>"] = { "show", "select_next", "fallback" },
      ["<C-s>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
  },
}
