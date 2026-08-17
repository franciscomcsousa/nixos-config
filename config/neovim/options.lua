vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.relativenumber = true

vim.o.number = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.updatetime = 300

vim.o.autoread = true

-- Automatically reload open buffers when files change on disk.
local autoreload = vim.api.nvim_create_augroup('AutoReload', { clear = true })

local function safe_checktime()
  -- Avoid checking while in command-line mode or in the command-line window,
  -- which would raise an error.
  if vim.fn.mode() == 'c' or vim.fn.getcmdwintype() ~= '' then
    return
  end
  vim.cmd('silent! checktime')
end

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = autoreload,
  pattern = '*',
  callback = safe_checktime,
})

-- Poll the disk on a timer so open buffers reload even when Neovim is
-- unfocused and idle (e.g. while Copilot edits files in another pane).
local reload_timer = vim.uv.new_timer()
reload_timer:start(
  1000,
  1000,
  vim.schedule_wrap(safe_checktime)
)

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = autoreload,
  pattern = '*',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)
  end,
})

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.o.foldlevelstart = 99
