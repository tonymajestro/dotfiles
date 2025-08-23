-- set scrolloff on window resize
vim.api.nvim_create_autocmd({ "WinResized" }, {
  group = vim.api.nvim_create_augroup("smart_scrolloff", { clear = true }),
  callback = function()
    local percentage = .25
    vim.opt.scrolloff = math.floor(vim.o.lines * percentage)
  end
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
    "qf",
    "git",
    "oil",
    "trouble",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      local close_buffer = function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end
      vim.keymap.set("n", "q", close_buffer, { buffer = event.buf, silent = true, desc = "Close buffer", nowait = true })
      vim.keymap.set("n", "<esc>", close_buffer,
        { buffer = event.buf, silent = true, desc = "Close buffer", nowait = true })
    end)
  end,
})
