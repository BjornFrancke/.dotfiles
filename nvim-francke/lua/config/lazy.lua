local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		"ayu-theme/ayu-vim",
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"lua-language-server",
					"stylua",
					"typescript-language-server",
					"biome",
					"netcoredbg",
					-- "csharpier",
				},
			},
		},
		{
			"pmizio/typescript-tools.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		{
			"neovim/nvim-lspconfig",
		},
		{
			"seblyng/roslyn.nvim",
			ft = "cs",
			opts = {},
		},
		{
			"mfussenegger/nvim-dap",
		},
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
			opts = {},
		},
		{
			"nicholasmata/nvim-dap-cs",
			dependencies = { "mfussenegger/nvim-dap" },
			opts = {},
		},
		{
			"numToStr/Comment.nvim",
			opts = {
				-- add any options here
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			opts = {
				ensure_installed = {
					"c_sharp",
					"lua",
					"vim",
					"vimdoc",
					"json",
					"xml",
					"html",
					"css",
					"javascript",
					"typescript",
				},
				highlight = { enable = true },
				indent = { enable = true },
			},
		},
	},
	change_detection = { notify = false },
})
