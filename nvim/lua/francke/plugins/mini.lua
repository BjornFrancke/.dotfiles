return {
	-- Better Around/Inside textobjects
	{
		"echasnovski/mini.ai",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local ai = require("mini.ai")
			ai.setup({
				n_lines = 500,
				-- Custom textobjects
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					g = function() -- Whole buffer
						local from = { line = 1, col = 1 }
						local to = {
							line = vim.fn.line("$"),
							col = math.max(vim.fn.getline("$"):len(), 1),
						}
						return { from = from, to = to }
					end,
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			})
		end,
	},

	-- Auto pairs
	{
		"echasnovski/mini.pairs",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.pairs").setup({
				-- In which modes mappings from this `config` should be created
				modes = { insert = true, command = false, terminal = false },
				-- Global mappings. Each right hand side should be a pair information, a
				-- table with at least these fields (see more in |MiniPairs.map|):
				-- - <action> - one of 'open', 'close', 'closeopen'.
				-- - <pair> - two character string for pair to be used.
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

					['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
					["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
					["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
				},
			})
		end,
	},

	-- Surround actions
	{
		"echasnovski/mini.surround",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.surround").setup({
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,
				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
				-- Number of lines within which surrounding is searched
				n_lines = 20,
				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = false,
				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more info, see
				-- `:h MiniSurround.config`.
				search_method = "cover",
				-- Whether to disable showing non-error feedback
				silent = false,
			})
		end,
	},
}
