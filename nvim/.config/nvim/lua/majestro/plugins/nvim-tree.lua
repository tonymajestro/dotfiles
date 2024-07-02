local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local keymap = vim.keymap

   local function opts(desc)
     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
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
  --keymap.set('n', 'C', collapse_directories(false), opts('Collapse All'))
  keymap.set('n', 'C', function()
      api.tree.collapse_all(false)
  end, opts('Collapse All'))


  keymap.set('n', 'l', api.node.open.edit, opts('Edit'))
  keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close tree'))

  keymap.set('n', '<Esc>', function()
    -- Close nvim tree
    vim.cmd('NvimTreeClose')

    -- Also using esc to clear search text
    vim.cmd('noh')
  end, { noremap = true, silent = true })

  vim.keymap.set('n', '<LeftRelease>', function()
    local node = api.tree.get_node_under_cursor()
    if node ~= nil and node.nodes ~= nil then
      api.node.open.edit()
    end
  end)
end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.7

local function floating_window()
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
    border = 'rounded',
    relative = 'editor',
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
  }
end

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      view = {
        float = {
          enable = true,
          open_win_config = floating_window
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false
          }
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
          'brazil-pkg-cache',
          '.DS_Store',
          '.git'
        },
      },
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true
      }
    })

    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Open file when it is created
    local api = require('nvim-tree.api')
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd('edit ' .. file.fname)
    end)

  vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    callback = function()
      local buffers = vim.fn.getbufinfo({ buflisted = 1, bufloaded = 1 })
      local buf_count = 0

      -- Look for all non-hidden buffers
      for _, buf in ipairs(buffers) do
        if buf.name ~= '' and buf.hidden == 0 then
          buf_count = buf_count + 1
        end
      end

      -- Open NvimTree if there are no open buffers
      if buf_count == 0 then
        vim.cmd('NvimTreeFindFile')
      end
    end
})
  end,
  keys = {
    { '<leader>ee', '<cmd>NvimTreeFindFile<CR>zz', mode = 'n', desc = 'NvimTree Open' },
    { '<leader>ec', '<cmd>NvimTreeClose<CR>', mode = 'n', desc = 'NvimTree Close' },
  }
}
