vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    pcall(vim.treesitter.start, event.buf)
    vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})