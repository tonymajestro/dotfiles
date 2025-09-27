return {
  "folke/snacks.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    styles = {
      input = {
        relative = "cursor",
        width = 40,
        row = -3,
        col = -1,
        keys = {
          i_esc = { "<esc>", { "cancel" }, mode = "i", expr = true },
        }
      },
    },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    input = {
      enabled = true,
      relative = "cursor"
    },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          follow_file = true,
          hidden = true,
          actions = {
            recursive_toggle = function(picker, item)
              local Actions = require("snacks.explorer.actions")
              local Tree = require("snacks.explorer.tree")

              local get_children = function(node)
                local children = {}
                for _, child in pairs(node.children) do
                  table.insert(children, child)
                end
                return children
              end

              local refresh = function()
                Actions.update(picker, { refresh = true })
              end

              local function toggle_recursive(node)
                Tree:toggle(node.path)
                refresh()
                vim.schedule(function()
                  local children = get_children(node)
                  if #children ~= 1 then
                    return
                  end
                  local child = children[1]
                  if not child.dir then
                    return
                  end
                  toggle_recursive(child)
                end)
              end

              local node = Tree:node(item.file)
              if not node then
                return
              end

              if node.dir then
                toggle_recursive(node)
              else
                picker:action("confirm")
              end
            end,
          },
          win = {
            list = {
              keys = {
                ["<CR>"] = "recursive_toggle",
              },
            },
          },
        },
      },
    },
    terminal = { enabled = true },
    scratch = { enabled = true },
  },
  keys = {
    { "<leader>e",  function() Snacks.explorer() end,     desc = "Explorer Snacks (root dir)", },
    {
      "<leader><space>",
      function()
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
            { win = "input",   height = 1,          border = "bottom" },
            { win = "list",    border = "none" },
            { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
          },
        }
        Snacks.picker.smart({ multi = { "files" }, layout = select })
      end,
      desc = "Find Files (cwd)",
    },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files (cwd)", },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep" },
    { "<leader>/",  function() Snacks.picker.lines() end,               desc = "Buffer Lines" },
    { "<leader>sh", function() Snacks.picker.help() end,                desc = "Help Pages" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,         desc = "LSP Symbols", },
    { "<leader>sk", function() Snacks.picker.keymaps() end,             desc = "Keymaps" },
    { "<leader>sr", function() require("snacks.picker").resume() end,   desc = "Resume snacks picker" },
    { "<leader>ff", function() Snacks.picker.files() end,               desc = "Find Files (cwd)", },
    { "<leader>.",  function() Snacks.scratch() end,                    desc = "Toggle Scratch Buffer" },
    { "<C-/>",      function() Snacks.terminal.toggle() end,            desc = "Toggle Scratch Terminal", mode = { "n", "t" } },
    { "<C-/>",      function() Snacks.terminal.toggle() end,            desc = "Toggle Scratch Terminal" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,    desc = "Goto Declaration" },
    { "gI",         function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gr",         function() Snacks.picker.lsp_references() end,      desc = "Goto References",         nowait = true }
  },
}
