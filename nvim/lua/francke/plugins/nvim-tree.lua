return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Disable netrw at the very start of your init.lua (recommended by nvim-tree)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			-- Side to open the tree on
			view = {
				side = "right",
				width = 35,
				-- Preserve window layout when opening files
				preserve_window_proportions = true,
			},
			-- Renderer settings
			renderer = {
				-- Show git status icons
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
					},
				},
				-- Indent markers
				indent_markers = {
					enable = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						none = " ",
					},
				},
				-- Highlight opened files
				highlight_opened_files = "name",
				-- Root folder modifier
				root_folder_label = ":~:s?$?/..?",
			},
			-- Update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			-- Show LSP and COC diagnostics in the tree
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			-- Git integration
			git = {
				enable = true,
				ignore = false,
				show_on_dirs = true,
				timeout = 400,
			},
			-- Actions when opening files
			actions = {
				open_file = {
					-- Close tree when opening a file
					quit_on_open = false,
					-- Resize splits when opening file
					resize_window = true,
					window_picker = {
						enable = true,
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
			},
			-- Filters
			filters = {
				dotfiles = false, -- Show dotfiles
				custom = { ".git", "node_modules", ".cache" }, -- Hide these
			},
			-- Tab settings
			tab = {
				sync = {
					open = false,
					close = false,
				},
			},
			-- Trash settings
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
			-- Log settings
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})

		-- Keybindings
		-- Toggle nvim-tree with Cmd+b (like VSCode sidebar)
		vim.keymap.set("n", "<D-b>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true })

		-- Alternative toggle with leader key (in case Cmd doesn't work in your terminal)
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true })

		-- Focus nvim-tree
		vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "Focus file explorer", silent = true })

		-- Find current file in tree
		vim.keymap.set("n", "<leader>ec", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer", silent = true })

		-- Collapse all folders
		vim.keymap.set("n", "<leader>eC", ":NvimTreeCollapse<CR>", { desc = "Collapse file explorer", silent = true })

		-- Auto-close nvim-tree when it's the last window
		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local tree_wins = {}
				local floating_wins = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("NvimTree_") ~= nil then
						table.insert(tree_wins, w)
					end
					if vim.api.nvim_win_get_config(w).relative ~= "" then
						table.insert(floating_wins, w)
					end
				end
				if 1 == #wins - #floating_wins - #tree_wins then
					-- Should quit, so we close all invalid windows.
					for _, w in ipairs(tree_wins) do
						vim.api.nvim_win_close(w, true)
					end
				end
			end,
		})
	end,
}
