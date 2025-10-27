return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	---@module "ibl"
	---@type ibl.config
	config = function()
		-- Rainbow colors for indent guides (subtle, works with Ayu)
		local highlight = {
			"RainbowCyan",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowRed",
		}

		local hooks = require("ibl.hooks")

		-- Create the highlight groups in the highlight setup hook
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- Subtle colors that work well with Ayu theme
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#5CCFE6" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFCC66" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#73D0FF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FFAE57" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#BAE67E" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D4BFFF" })
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F28779" })
		end)

		require("ibl").setup({
			indent = {
				char = "│", -- Thin vertical line
				tab_char = "│",
				highlight = highlight,
				smart_indent_cap = true,
			},
			whitespace = {
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				show_exact_scope = true,
				highlight = highlight,
				-- Include these node types in scope
				include = {
					node_type = {
						["*"] = {
							"argument_list",
							"arguments",
							"assignment_statement",
							"block",
							"bracket",
							"call_expression",
							"class",
							"do_block",
							"element",
							"except",
							"function",
							"if_statement",
							"import_statement",
							"list_literal",
							"method",
							"object",
							"operation",
							"parenthesized_expression",
							"selector",
							"statement",
							"struct",
							"subscript",
							"table",
							"try",
							"tuple",
							"type",
							"var",
							"while",
							"with",
						},
					},
				},
			},
			exclude = {
				filetypes = {
					"dashboard",
					"help",
					"startify",
					"alpha",
					"neo-tree",
					"NvimTree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})

		-- Add scope highlight to current indent level
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}

