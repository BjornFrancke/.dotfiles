-- Visual enhancements and polish
return {
	-- Highlight word under cursor
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				-- Providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				-- Delay in milliseconds before highlighting
				delay = 100,
				-- Filetypes to exclude
				filetypes_denylist = {
					"dirvish",
					"fugitive",
					"NvimTree",
					"oil",
					"Trouble",
					"lazy",
					"mason",
				},
				-- Filetypes to include (leave empty to include all)
				filetypes_allowlist = {},
				-- Modes to exclude
				modes_denylist = {},
				-- Modes to include
				modes_allowlist = {},
				-- Providers to exclude when under cursor
				providers_regex_syntax_denylist = {},
				-- Providers to exclude in large files
				large_file_cutoff = 2000,
				-- Override large file config for specific providers
				large_file_overrides = nil,
				-- Minimum number of matches to highlight
				min_count_to_highlight = 2,
			})

			-- Set highlight colors to match Ayu theme
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3E4B59" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3E4B59" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3E4B59", underline = true })
		end,
	},

	-- Better looking notifications and command line
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- Override markdown rendering so that **coc.nvim** can take over
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["coc.nvim.lsp.util.convert_input_to_markdown_lines"] = true,
					},
					-- Show progress messages from LSP
					progress = {
						enabled = true,
						format = "lsp_progress",
						format_done = "lsp_progress_done",
						throttle = 1000 / 30, -- frequency to update lsp progress message
						view = "mini",
					},
					-- Hover doc
					hover = {
						enabled = false, -- Let CoC handle this
					},
					-- Signature help
					signature = {
						enabled = false, -- Let CoC handle this
					},
				},
				-- Better command line at the center
				cmdline = {
					enabled = true,
					view = "cmdline_popup", -- Floating command line
					format = {
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
						lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
						help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					},
				},
				-- Messages at the bottom right
				messages = {
					enabled = true,
					view = "notify", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages
				},
				-- Popups and confirm dialogs
				popupmenu = {
					enabled = true,
					backend = "nui", -- backend to use to show regular cmdline completions
				},
				-- Notifications
				notify = {
					enabled = true,
					view = "notify",
				},
				-- Presets for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				-- Routes to control message flow
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "more lines",
						},
						opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "fewer lines",
						},
						opts = { skip = true },
					},
				},
			})

			-- Configure nvim-notify
			require("notify").setup({
				background_colour = "#0F131A", -- Ayu dark background
				fps = 60,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				level = 2,
				minimum_width = 50,
				render = "compact",
				stages = "fade_in_slide_out",
				timeout = 3000,
				top_down = false,
			})
		end,
	},

	-- Better UI for input and select
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					default_prompt = "➤ ",
					prompt_align = "left",
					insert_only = true,
					start_in_insert = true,
					border = "rounded",
					relative = "cursor",
					prefer_width = 40,
					width = nil,
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
					win_options = {
						winblend = 0,
						wrap = false,
					},
					mappings = {
						n = {
							["<Esc>"] = "Close",
							["<CR>"] = "Confirm",
						},
						i = {
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
							["<Up>"] = "HistoryPrev",
							["<Down>"] = "HistoryNext",
						},
					},
				},
				select = {
					enabled = true,
					backend = { "telescope", "builtin" },
					trim_prompt = true,
					telescope = require("telescope.themes").get_dropdown({
						layout_config = {
							width = 0.8,
							height = 0.8,
						},
					}),
					builtin = {
						border = "rounded",
						relative = "editor",
						win_options = {
							winblend = 0,
						},
						mappings = {
							["<Esc>"] = "Close",
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
						},
					},
				},
			})
		end,
	},
}
