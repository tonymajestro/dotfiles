return {
  "ibhagwan/fzf-lua",
  opts = {
    keymap = {
      fzf = {
        ["ctrl-a"] = "select-all",
        ["ctrl-q"] = "accept",
      },
    },
    files = {
      actions = {
        ["enter"] = require("fzf-lua.actions").file_edit,
      },
      git_icons = false,
    },
    buffers = {
      actions = {
        ["ctrl-d"] = { fn = require("fzf-lua.actions").buf_del, reload = true },
      },
      sort_lastused = false,
    },
    previewers = {
      builtin = {
        treesitter = {
          enabled = false,
        },
      },
    },
  },
  keys = {
    { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    { "<leader>fR", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
  },
}
