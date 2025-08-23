return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      max_width = 0.5,
      max_height = 0.7
    },
    keymaps = {
      ["H"] = { "actions.parent", mode = "n" },
      ["L"] = "actions.select",
    }
  }
}
