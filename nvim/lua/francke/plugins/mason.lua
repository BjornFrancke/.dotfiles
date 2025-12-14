return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = "rounded",
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                -- TypeScript/JavaScript/React
                "ts_ls",
                -- TailwindCSS
                "tailwindcss",
                -- HTML
                "html",
                -- JSON
                "jsonls",
                -- Docker
                "dockerls",
                "docker_compose_language_service",
                -- SQL
                "sqlls",
                -- Lua (for neovim config)
                "lua_ls",
                -- Go (you had this in coc-settings)
                "gopls",
            },
            automatic_installation = true,
        })
    end,
}
