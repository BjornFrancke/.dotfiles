return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "tsx",
                    "typescript",
                    "javascript",
                    "html",
                    "json",
                    "jsdoc",
                    "lua",
                    "markdown",
                    "toml",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "xml",
                    "markdown_inline",
                    "regex",
                    "diff",
                },
                highlight = {
                    enable = true,
                    use_languagetree = true
                },
                indent = {
                    enable = true,
                    disable = {},
                },

            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },

    }
}
