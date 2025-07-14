return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		require('telescope').setup({
			defaults = {
				mappings = {
					i = {
						-- Open in vertical split
						["<C-v>"] = actions.select_vertical,
						-- Open in horizontal split
						["<C-x>"] = actions.select_horizontal,
						-- Open in new tab
						["<C-t>"] = actions.select_tab,
						-- Move selection up/down
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						-- Open in vertical split
						["<C-v>"] = actions.select_vertical,
						-- Open in horizontal split
						["<C-x>"] = actions.select_horizontal,
						-- Open in new tab
						["<C-t>"] = actions.select_tab,
					}
				}
			}
		})

		-- Keymaps
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
		
		-- Additional useful telescope commands for split workflows
		vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find word under cursor" })
	end,
}
