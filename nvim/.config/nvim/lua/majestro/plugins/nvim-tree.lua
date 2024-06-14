local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local keymap = vim.keymap

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

  -- Unset C-k since I use it for document scrolling
  keymap.del('n', '<C-k>', { buffer = bufnr })

  -- custom mappings
  keymap.set("n", "C", collapse_directories(false), opts("Collapse All"))
  keymap.set("n", "l", api.node.open.edit, opts("Edit"))
  keymap.set("n", "h", api.node.navigate.parent_close, opts("Close tree"))
  keymap.set("n", "<Esc>", "<cmd>NvimTreeClose<CR>")


  vim.keymap.set('n', '<LeftRelease>', function()
		local node = api.tree.get_node_under_cursor()

		if node.nodes ~= nil then
			api.node.open.edit()
		end
	end, {})
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.7


    nvimtree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      view = {
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                             - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
            end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
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

    local api = require("nvim-tree.api")

    -- Open file when it is created
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

    -- Keybindings
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>zz")
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<CR>")

  end
}
