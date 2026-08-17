-- Persist and restore a session per working directory.
-- Launching `nvim` (no file args) in a directory restores its last session.
vim.o.sessionoptions = 'blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal,localoptions'

require('auto-session').setup({
  -- Don't auto-save/restore sessions in these directories.
  suppressed_dirs = { '~/', '~/Downloads', '/' },
  -- Close neo-tree before saving so it restores cleanly.
  pre_save_cmds = { 'Neotree close' },
})
