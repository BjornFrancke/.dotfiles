local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
	end

	-- Navigation
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gr", require("telescope.builtin").lsp_references, "References")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gi", require("telescope.builtin").lsp_implementations, "Go to implementation")
	map("n", "K", vim.lsp.buf.hover, "Hover docs")

	-- Actions
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

	-- Diagnostics
	map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
	map("n", "<leader>dn", vim.diagnostic.goto_next, "Next diagnostic")
	map("n", "<leader>dp", vim.diagnostic.goto_prev, "Previous diagnostic")

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
