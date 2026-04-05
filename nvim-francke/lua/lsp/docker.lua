local lsp = require("config.lsp")

vim.lsp.config("dockerls", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})

vim.lsp.enable("dockerls")

vim.lsp.config("docker_compose_language_service", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})

vim.lsp.enable("docker_compose_language_service")
