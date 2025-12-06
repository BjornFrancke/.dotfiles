return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Define formatters per filetype
        formatters_by_ft = {
            javascript = { "biome" },
            javascriptreact = { "biome" },
            typescript = { "biome" },
            typescriptreact = { "biome" },
            json = { "biome" },
            jsonc = { "biome" },
            css = { "biome" },
            -- Fallback to other formatters if needed
            lua = { "stylua" },
            python = { "isort", "black" },
            go = { "gofmt" },
        },
        -- Format on save configuration (disabled by default to avoid errors on incomplete code)
        -- Uncomment to enable auto-format on save:
        -- format_on_save = {
        --     timeout_ms = 500,
        --     lsp_fallback = true,
        -- },
        -- Customize formatters
        formatters = {
            biome = {
                command = "biome",
                args = {
                    "format",
                    "--write",
                    "--stdin-file-path",
                    "$FILENAME",
                },
                stdin = true,
                -- Don't fail silently, but also don't block on errors
                exit_codes = { 0, 1 },
            },
        },
    },
}
