return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = false,
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
}
