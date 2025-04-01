return {
	{
		"ayu-theme/ayu-vim",
		config = function()
			--	vim.opt.termguicolors = true -- enable true colors support
			--	vim.g.ayucolor = "light" -- for light version of theme
			-- vim.g.ayucolor = "mirage" -- for mirage version of theme
			vim.g.ayucolor = "dark" -- for dark version of theme
			vim.cmd("colorscheme ayu")
		end,
	},
}
