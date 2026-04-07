local lsp = require("config.lsp")

vim.lsp.config("html", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	filetypes = { "html", "mjml" },
})

vim.lsp.enable("html")
