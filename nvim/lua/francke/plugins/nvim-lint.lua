return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure linters by filetype
        lint.linters_by_ft = {
            javascript = { "biomejs" },
            javascriptreact = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },
            json = { "biomejs" },
            jsonc = { "biomejs" },
        }

        -- Create custom biome linter
        lint.linters.biomejs = {
            cmd = "biome",
            stdin = true,
            args = {
                "lint",
                "--stdin-file-path",
                function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            },
            stream = "stdout",
            ignore_exitcode = true,
            parser = require("lint.parser").from_pattern(
                [[(%d+):(%d+) lint/(%w+) (%w+) (.+)]],
                { "lnum", "col", "code", "severity", "message" },
                {
                    error = vim.diagnostic.severity.ERROR,
                    warn = vim.diagnostic.severity.WARN,
                }
            ),
        }

        -- Auto-lint on certain events
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        -- Keybinding to manually trigger linting
        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
