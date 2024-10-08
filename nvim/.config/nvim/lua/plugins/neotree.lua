return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree filesystem reveal<cr>",
      desc = "Explore NeoTree (Root Dir)",
    },
  },
  opts = {
    close_if_last_window = true,
    window = {
      auto_expand_width = true,
      width = "30%",
      popup = {
        size = {
          width = "70%",
          height = "80%",
        },
      },
      mappings = {
        ["<Esc>"] = "close_window",
        ["|"] = "open_vsplit",
        ["-"] = "open_split",
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    renderers = {
      file = {
        { "indent" },
        {
          "container",
          content = {
            {
              "name",
              zindex = 10,
            },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "modified", zindex = 20, align = "right" },
            { "diagnostics", zindex = 20, align = "right" },
            { "git_status", zindex = 10, align = "right" },
            { "file_size", zindex = 10, align = "right" },
            { "type", zindex = 10, align = "right" },
            { "last_modified", zindex = 10, align = "right" },
            { "created", zindex = 10, align = "right" },
          },
        },
      },
    },
    default_component_configs = {
      indent = {
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    filesystem = {
      group_empty_dirs = true,
    },
  },
}
