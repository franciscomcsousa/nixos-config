-- Use nvim-notify as the handler for vim.notify (pretty, animated notifications).
local notify = require('notify')

notify.setup({
  stages = 'fade',
  timeout = 3000,
  render = 'compact',
  top_down = false,
})

vim.notify = notify
