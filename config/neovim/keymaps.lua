-- Yank the path of the current file to the system clipboard.
-- 'yp' = yank path (relative to cwd, handy for Copilot CLI's # references).
vim.keymap.set('n', '<leader>yp', function()
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  vim.notify('Yanked path: ' .. path)
end, { desc = 'Yank relative file path to clipboard' })

-- 'yP' = yank the absolute path of the current file.
vim.keymap.set('n', '<leader>yP', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Yanked path: ' .. path)
end, { desc = 'Yank absolute file path to clipboard' })
