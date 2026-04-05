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
					"dockerfile-language-server",
					"docker-compose-language-service",
					"terraform-ls",
					"yamlfmt",
					"ansible-language-server",
					"ansible-lint",
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
				pre_hook = function()
					if vim.bo.filetype == "yaml.ansible" then
						return "# %s"
					end
				end,
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
					"dockerfile",
					"terraform",
					"hcl",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
			},
		},
	},
	change_detection = { notify = false },
})
