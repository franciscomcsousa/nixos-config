local builtin = require('telescope.builtin')
local actions = require "telescope.actions"

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Grep string under cursor' })
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy search in buffer' })

require("telescope").setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				}
			}
		}
	},
}

require("telescope").load_extension("fzf")
