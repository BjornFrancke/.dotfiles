-- Code outline using coc.nvim
-- Uses CocList outline for symbol navigation
return {
	-- This is a lightweight config that adds keymaps for coc outline
	-- Make sure you have coc-outline or similar extension installed
	-- Run: :CocInstall coc-lists (includes outline support)
	{
		"neoclide/coc.nvim",
		keys = {
			-- Outline using CocList
			{
				"<leader>o",
				"<cmd>CocList outline<CR>",
				desc = "Code outline (coc)",
			},
			-- Document symbols (alternative)
			{
				"<leader>cs",
				"<cmd>CocList symbols<CR>",
				desc = "Workspace symbols (coc)",
			},
		},
	},
}
