return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-mini/mini.icons", opts = {} },
		},
		keys = {
			{ "-", "<cmd>Oil --float<cr>" },
			{ "<leader>pv", "<cmd>Oil<cr>" },
		},
		opts = {
			default_file_explorer = true,

			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},

			view_options = {
				show_hidden = true,
			},

			win_options = {
				wrap = false,
				signcolumn = "no",
			},

			float = {
				padding = 2,
				max_width = 80,
				max_height = 30,
				border = "rounded",
			},

			keymaps = {
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["q"] = "actions.close",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["g."] = "actions.toggle_hidden",
			},
		},
	},
}
