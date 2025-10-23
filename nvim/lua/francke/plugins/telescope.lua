return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')
			local telescope = require('telescope')

			telescope.setup({
				defaults = {
					-- Better file ignore patterns
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist/",
						"build/",
						"target/",
						"%.lock",
					},
					-- Use bottom layout for better visibility
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					sorting_strategy = "ascending",
					-- Better preview settings
					preview = {
						treesitter = true,
					},
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
							-- Cycle through history
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							-- Close telescope
							["<C-c>"] = actions.close,
							["<esc>"] = actions.close,
							-- Send to quickfix list
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
						n = {
							-- Open in vertical split
							["<C-v>"] = actions.select_vertical,
							-- Open in horizontal split
							["<C-x>"] = actions.select_horizontal,
							-- Open in new tab
							["<C-t>"] = actions.select_tab,
							-- Quick close
							["q"] = actions.close,
							-- Send to quickfix
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						}
					},
					-- Better default options
					prompt_prefix = "  ",
					selection_caret = " ",
					path_display = { "truncate" },
					-- Live grep arguments for better searching
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden", -- Search hidden files
						"--glob=!.git/", -- But not .git
					},
				},
				pickers = {
					find_files = {
						hidden = true, -- Show hidden files
						find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
					},
					live_grep = {
						additional_args = function(opts)
							return { "--hidden", "--glob", "!.git/*" }
						end,
					},
					buffers = {
						sort_lastused = true,
						sort_mru = true,
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							}
						}
					},
				},
			})

			-- Load fzf native extension for better performance
			pcall(telescope.load_extension, 'fzf')

			-- Core file finding
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
			vim.keymap.set('n', '<leader>fa', function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end, { desc = "Find all files (including ignored)" })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find word under cursor" })

			-- Git-specific finding
			vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = "Git files" })
			vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = "Git commits" })
			vim.keymap.set('n', '<leader>fC', builtin.git_bcommits, { desc = "Git buffer commits" })

			-- Code navigation
			vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
			vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Diagnostics" })

			-- Search in open buffers
			vim.keymap.set('n', '<leader>f/', function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Buffers",
				})
			end, { desc = "Search in open buffers" })

			-- Search current buffer
			vim.keymap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = "Fuzzy search current buffer" })

			-- Resume last telescope picker
			vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume last picker" })

			-- Vim pickers
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Marks" })
			vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "Jumplist" })
			vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "Quickfix list" })
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
}
