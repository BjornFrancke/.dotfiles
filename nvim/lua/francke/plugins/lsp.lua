return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Enhanced capabilities for nvim-cmp
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Keymaps (only set when LSP attaches)
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local keymap = vim.keymap.set

            -- Navigation (matching your CoC keybindings)
            keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
            keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
            keymap("n", "gy", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
            keymap("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
            keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))

            -- Documentation
            keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hover documentation" }))
            keymap("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
            keymap("i", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

            -- Actions (matching your CoC keybindings)
            keymap("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
            keymap("n", "<leader>ac", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action (cursor)" }))

            -- Diagnostics
            keymap("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
            keymap("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
            keymap("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))

            -- Workspace
            keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
            keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
            keymap("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
        end

        -- Diagnostic appearance
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
                spacing = 4,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = true,
            },
        })

        -- Diagnostic signs
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Custom hover handler that filters empty content (fixes tailwindcss empty sections)
        vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
            config = config or { border = "rounded" }
            config.border = config.border or "rounded"

            if not (result and result.contents) then
                return
            end

            -- Filter out empty markdown content
            local contents = result.contents
            if type(contents) == "table" and contents.kind == "markdown" then
                local value = contents.value or ""
                -- Remove empty code blocks and excessive whitespace
                value = value:gsub("```[%w]*\n*```", "")
                value = value:gsub("\n\n\n+", "\n\n")
                value = value:gsub("^%s+", ""):gsub("%s+$", "")

                if value == "" or value == "---" then
                    return
                end
                result.contents.value = value
            end

            return vim.lsp.handlers.hover(_, result, ctx, config)
        end

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- Server configurations
        local servers = {
            -- TypeScript/JavaScript (includes React, Bun support)
            ts_ls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        preferences = {
                            includeCompletionsForModuleExports = true,
                            includeCompletionsForImportStatements = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        preferences = {
                            includeCompletionsForModuleExports = true,
                            includeCompletionsForImportStatements = true,
                        },
                    },
                },
            },

            -- TailwindCSS
            tailwindcss = {
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            },

            -- HTML
            html = {
                filetypes = { "html", "templ" },
            },

            -- JSON
            jsonls = {
                settings = {
                    json = {
                        validate = { enable = true },
                    },
                },
            },

            -- Docker
            dockerls = {},
            docker_compose_language_service = {},

            -- SQL
            sqlls = {},

            -- Lua (for Neovim config)
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            },

            -- Go
            gopls = {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            },
        }

        -- Setup all servers
        for server, config in pairs(servers) do
            config.capabilities = capabilities
            config.on_attach = on_attach
            lspconfig[server].setup(config)
        end
    end,
}
