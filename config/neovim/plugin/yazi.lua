-- Open yazi in a floating window inside neovim.
-- '<leader>e' = open yazi at the current file.
require('yazi').setup({
  open_for_directories = false,
})

vim.keymap.set('n', '<leader>e', '<cmd>Yazi<cr>', { desc = 'Open yazi at current file' })
vim.keymap.set('n', '<leader>cw', '<cmd>Yazi cwd<cr>', { desc = 'Open yazi in working directory' })
