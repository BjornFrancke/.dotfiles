local lsp = require("config.lsp")

require("typescript-tools").setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = "all",
        tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
        }
    },

})
