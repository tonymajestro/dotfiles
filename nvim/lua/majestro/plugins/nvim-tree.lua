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

  -- Unset C-k since I use it for document scrolling
  vim.keymap.del('n', '<C-k>', { buffer = bufnr })
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
        width = "30%",
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
    -- Taken from https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#make-q-and-bd-work-as-if-tree-was-not-visible
    vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
      nested = false,
      callback = function(e)
        local tree = require('nvim-tree.api').tree

        -- Nothing to do if tree is not opened
        if not tree.is_visible() then
          return
        end

        -- How many focusable windows do we have? (excluding e.g. incline status window)
        local winCount = 0
        for _,winId in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(winId).focusable then
            winCount = winCount + 1
          end
        end

        -- We want to quit and only one window besides tree is left
        if e.event == 'QuitPre' and winCount == 2 then
          vim.api.nvim_cmd({cmd = 'qall'}, {})

        end

        -- :bd was probably issued an only tree window is left
        -- Behave as if tree was closed (see `:h :bd`)
        if e.event == 'BufEnter' and winCount == 1 then
          -- Required to avoid "Vim:E444: Cannot close last window"
          vim.defer_fn(function()
            -- close nvim-tree: will go to the last buffer used before closing
            tree.toggle({find_file = true, focus = true})
            -- re-open nivm-tree
            tree.toggle({find_file = true, focus = false})
          end, 10)
        end
      end
    })

    -- Autosession workaround
    -- Taken from https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      pattern = 'NvimTree*',
      callback = function()
        local api = require('nvim-tree.api')
        local view = require('nvim-tree.view')

        if not view.is_visible() then
          api.tree.open()
        end
      end,
    })

    local api = require("nvim-tree.api")

    -- Expand all subtrees
    local expand = function()
      local Event = api.events.Event
      api.events.subscribe(Event.TreeOpen, function()
        api.tree.expand_all()
      end)
    end

    -- Currently I am disabling expansion of all subtrees in nvim
    -- expand()

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
