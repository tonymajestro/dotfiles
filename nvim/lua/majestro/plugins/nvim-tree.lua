local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

   local function opts(desc)
     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
   end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  local function collapse_directories(keep_buffers)
    return function()
      api.tree.collapse_all(keep_buffers)
    end
  end

  -- custom mappings
  vim.keymap.set("n", "C", collapse_directories(false), opts("Collapse All"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Edit"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close tree"))
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        dotfiles = true,
        custom = { 
          "brazil-pkg-cache",
          ".DS_Store",
          ".git"
        },
      },
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true
      },
    })

    -- Close nvim if NvimTree is the only buffer open
    -- Taken from https://github.com/nvim-tree/nvim-tree.lua/issues/1368
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
      end
    })

    local api = require("nvim-tree.api")

    -- Expand all subtrees
    local Event = api.events.Event
    api.events.subscribe(Event.TreeOpen, function()
      api.tree.expand_all()
    end)

    -- Open file when it is created
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

    -- Keybindings
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>")
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<CR>")

  end
}
