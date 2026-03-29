local lsp = require("config.lsp")

require("roslyn").setup({
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})
