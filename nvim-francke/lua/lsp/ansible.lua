local lsp = require("config.lsp")

vim.lsp.config("ansiblels", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	settings = {
		ansible = {
			python = {
				interpreterPath = "/opt/homebrew/opt/ansible/libexec/bin/python3",
			},
			validation = {
				lint = {
					enabled = true,
				},
			},
		},
	},
})

vim.lsp.enable("ansiblels")
