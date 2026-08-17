-- which-key shows available keybindings in a popup as you type a prefix.
local wk = require('which-key')

wk.setup({})

-- Label the leader groups so the popup is organised.
wk.add({
  { '<leader>f', group = 'find (telescope)' },
  { '<leader>b', group = 'buffers' },
  { '<leader>y', group = 'yank path' },
  { 'g', group = 'lsp/goto' },
})
