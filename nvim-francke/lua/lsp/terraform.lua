local lsp = require("config.lsp")

vim.lsp.config("terraformls", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})

vim.lsp.enable("terraformls")
