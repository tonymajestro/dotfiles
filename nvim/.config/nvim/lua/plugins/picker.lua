local select = {
  preview = false,
  layout = {
    backdrop = false,
    width = 0.5,
    min_width = 80,
    height = 0.4,
    min_height = 10,
    box = "vertical",
    border = "rounded",
    title = " Files ",
    title_pos = "center",
    { win = "input", height = 1, border = "bottom" },
    { win = "list", border = "none" },
    { win = "preview", title = "{preview}", height = 0.4, border = "top" },
  },
}

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart({ multi = { "files" }, layout = select })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>ff",
      LazyVim.pick("files", { root = false, hidden = true, ignored = true }),
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fF",
      LazyVim.pick("files", { hidden = true, ignored = true }),
      desc = "Find Files (Root Dir)",
    },
    { "<leader>sg", LazyVim.pick("live_grep"), desc = "Find Files (Root Dir)" },
    {
      "<leader>qq",
      function()
        Snacks.picker.qflist({ layout = "ivy" })
      end,
      desc = "Find quickfix list",
    },
  },
}
