vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    pcall(vim.treesitter.start, event.buf)
    vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'yml' },
  callback = function()
    vim.wo.foldcolumn = '1'
  end,
})