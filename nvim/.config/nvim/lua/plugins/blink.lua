return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-n>"] = { "show", "select_next", "fallback" },
      ["<C-j>"] = { "show", "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
