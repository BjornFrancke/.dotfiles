return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		focus = true, -- Focus the trouble window when opened
		auto_close = false, -- Auto close when there are no items
		auto_preview = true, -- Auto preview the item under cursor
		modes = {
			diagnostics = {
				auto_open = false,
				auto_close = false,
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"]x",
			function()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			desc = "Next trouble item",
		},
		{
			"[x",
			function()
				require("trouble").prev({ skip_groups = true, jump = true })
			end,
			desc = "Previous trouble item",
		},
	},
}
