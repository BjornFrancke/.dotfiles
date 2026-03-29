local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
	end

	-- Navigation
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "K", vim.lsp.buf.hover)

	-- Actions
	map("n", "<leader>rn", vim.lsp.buf.rename)
	map("n", "<leader>ca", vim.lsp.buf.code_action)

	-- Diagnostics
	map("n", "<leader>e", vim.diagnostic.open_float)
	map("n", "<leader>dn", vim.diagnostic.goto_next)
	map("n", "<leader>dp", vim.diagnostic.goto_prev)

	-- Format
	-- map("n", "<leader>fm", function()
	--     vim.lsp.buf.format({ async = true })
	-- end
	-- )
	-- if client.name == "tsserver" or client.name == "ts_ls" then
	--     client.server_capabilities.documentFormattingProvider = false
	-- end
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

return M
