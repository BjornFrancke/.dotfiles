return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome" },
			jsonc = { "biome" },
			css = { "biome" },
			scss = { "biome" },
			html = { "biome" },

			lua = { "stylua" },

			cs = { "csharpier" },

				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },

				yaml = { "yamlfmt" },
				["yaml.ansible"] = {},
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "never",
		},
	},

	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({
					async = true,
					lsp_format = "never",
				})
			end,
		},
	},
}
