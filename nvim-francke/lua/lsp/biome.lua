local lsp = require("config.lsp")

vim.lsp.config("biome", {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"css",
		"graphql",
	},
	root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})

vim.lsp.enable("biome")
