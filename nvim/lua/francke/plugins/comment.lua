return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- Import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
			-- Add a space between comment and the line
			padding = true,
			-- Whether the cursor should stay at its position
			sticky = true,
			-- LHS of toggle mappings in NORMAL mode
			toggler = {
				line = "gcc", -- Line-comment toggle keymap
				block = "gbc", -- Block-comment toggle keymap
			},
			-- LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				line = "gc", -- Line-comment keymap
				block = "gb", -- Block-comment keymap
			},
			-- LHS of extra mappings
			extra = {
				above = "gcO", -- Add comment on the line above
				below = "gco", -- Add comment on the line below
				eol = "gcA", -- Add comment at the end of line
			},
			-- Enable keybindings
			-- NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				basic = true,
				extra = true,
			},
		})
	end,
}
