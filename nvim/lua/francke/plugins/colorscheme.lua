-- ========================================
-- COLORSCHEME: AYU DARK (OFFICIAL)
-- ========================================
-- Official Ayu theme - Matches VSCode exactly!
-- Keywords: Orange/Yellow
-- Strings: Yellow-green
-- Functions: Orange
-- ========================================

return {
	'ayu-theme/ayu-vim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.ayucolor = "dark" -- Options: dark, mirage, light
		vim.cmd('colorscheme ayu')
	end,
}
