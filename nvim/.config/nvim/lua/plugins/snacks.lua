return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      configure = false,
    },
    scroll = {
      enabled = false,
    },
    picker = {
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

              ---@param node snacks.picker.explorer.Node
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
          layout = {
            layout = {
              width = 80,
            }
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
  },
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.smart({ multi = { "files" }})
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
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  },
}
