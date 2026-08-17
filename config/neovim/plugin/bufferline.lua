require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		show_buffer_close_icons = true,
		show_close_icon = false,
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})

-- Cycle through buffers.
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })

-- Move buffers around in the bufferline.
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer right' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer left' })

-- Pin and close buffers.
vim.keymap.set('n', '<leader>bP', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- Jump directly to a buffer by its position in the bufferline.
for i = 1, 9 do
	vim.keymap.set('n', '<leader>' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>', { desc = 'Go to buffer ' .. i })
end
-- <leader>0 jumps to the last buffer.
vim.keymap.set('n', '<leader>0', '<cmd>BufferLineGoToBuffer -1<cr>', { desc = 'Go to last buffer' })
