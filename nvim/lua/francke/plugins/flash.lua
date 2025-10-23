return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		-- Labels to use for jump targets
		labels = "asdfghjklqwertyuiopzxcvbnm",
		-- When `true`, search will be case-insensitive
		search = {
			-- search/jump in all windows
			multi_window = true,
			-- search direction
			forward = true,
			-- when `false`, find only matches in the given direction
			wrap = true,
			-- Each mode has its own search configuration
			mode = "exact",
			-- behave like `incsearch`
			incremental = false,
		},
		-- Jump labels appear as you type
		jump = {
			-- save location in the jumplist
			jumplist = true,
			-- jump position
			pos = "start",
			-- automatically jump when there is only one match
			autojump = false,
			-- You can force inclusive/exclusive jumps by setting the
			-- `inclusive` option. By default it will be automatically
			-- set based on the mode.
			inclusive = nil,
		},
		label = {
			-- allow uppercase labels
			uppercase = true,
			-- add a label for the first match in the current window.
			-- you can always jump to the first match with `<CR>`
			current = true,
			-- show the label after the match
			after = true,
			-- show the label before the match
			before = false,
			-- position of the label extmark
			style = "overlay",
			-- flash tries to re-use labels that were already assigned to a position,
			-- when typing more characters. By default only lower-case labels are re-used.
			reuse = "lowercase",
		},
		-- You can override the default options for a specific mode.
		modes = {
			-- options used when flash is activated through
			-- a regular search with `/` or `?`
			search = {
				enabled = true, -- enable flash for search
				highlight = { backdrop = false },
				jump = { history = true, register = true, nohlsearch = true },
			},
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = {
				enabled = true,
				-- dynamic configuration for ftFT motions
				config = function(opts)
					-- autohide flash when in operator-pending mode
					opts.autohide = vim.fn.mode(true):find("no") and vim.v.operator == "y"

					-- disable jump labels when enabled and when using a count
					opts.jump_labels = opts.jump_labels and vim.v.count == 0

					-- Show jump labels only in operator-pending mode
					opts.multi_line = vim.v.count == 0
				end,
				-- hide after jump when not using jump labels
				autohide = false,
				-- show jump labels
				jump_labels = false,
				-- set to `false` to use the current line only
				multi_line = true,
				-- When using jump labels, set to 'true' to automatically jump
				-- or execute a motion when there is only one match
				autojump = false,
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				keys = { "f", "F", "t", "T", ";", "," },
				-- The direction for `prev` and `next` is determined by the motion.
				char_actions = function(motion)
					return {
						[";"] = "next", -- set to `right` to always go right
						[","] = "prev", -- set to `left` to always go left
					}
				end,
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = { register = false },
			},
			-- options for Treesitter selections
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range" },
				highlight = {
					backdrop = false,
					matches = false,
				},
			},
			-- options for remote flash
			remote = {
				remote_op = { restore = true, motion = true },
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
