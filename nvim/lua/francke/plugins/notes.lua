-- ~/.config/nvim/lua/francke/plugins/notes.lua
return {
    ---------------------------------------------------------------------------
    --  Zettelkasten core (zk + Telescope) ------------------------------------
    ---------------------------------------------------------------------------
    {
        "zk-org/zk-nvim",
        branch = "main",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope.nvim", tag = "0.1.6" },
        },
        config = function()
            local zk = require("zk")
            zk.setup({
                picker = "telescope",
                lsp = { auto_attach = { enabled = false } },
                notebook = { dir = vim.env.HOME .. "/notes" }

            })

            -- telescope extension is bundled; no external repo needed
            require("telescope").load_extension("zk")

            ---------------------------------------------------------------------
            -- keymaps ----------------------------------------------------------
            ---------------------------------------------------------------------
            local map, opts = vim.keymap.set, { noremap = true, silent = true }
            map("n", "<leader>zn",
                "<Cmd>ZkNew { dir = '0_inbox' }<CR>",
                vim.tbl_extend("force", opts, { desc = "ZK: new inbox note" }))

            map("n", "<leader>zd",
                "<Cmd>ZkNew { dir = '0_inbox', template = 'templates/daily.md' }<CR>",
                vim.tbl_extend("force", opts, { desc = "ZK: daily note" }))

            -- map("n", "<leader>zf",
            --     "<Cmd>lua require('telescope').extensions.zk.live_grep()<CR>",
            --     vim.tbl_extend("force", opts, { desc = "ZK: grep notes" }))

            map("n", "<leader>zf",
                "<Cmd>lua require('telescope').extensions.zk.notes()<CR>",
                vim.tbl_extend("force", opts, { desc = "ZK: fuzzy-find notes" }))

            map("n", "<leader>zb",
                "<Cmd>lua require('telescope').extensions.zk.backlinks()<CR>",
                vim.tbl_extend("force", opts, { desc = "ZK: backlinks" }))

            map("v", "<leader>zl",
                ":'<,'>ZkMatch<CR>",
                vim.tbl_extend("force", opts, { desc = "ZK: link visual selection" }))
        end,
    },

    ---------------------------------------------------------------------------
    --  Markdown quality-of-life helpers --------------------------------------
    ---------------------------------------------------------------------------
    {
        "lukas-reineke/headlines.nvim",
        ft = { "markdown", "norg" },
        opts = {},
    },
    { "folke/todo-comments.nvim", event = "VeryLazy", opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "markdown", "markdown_inline", "lua" },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    -- Markdown live preview (needs Node ≥16)
    {
        "iamcco/markdown-preview.nvim",
        cmd   = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft    = { "markdown" },
        -- official Lazy recipe: build via yarn/npm instead of calling mkdp#util#install during build
        build = "cd app && yarn install",
        init  = function() vim.g.mkdp_filetypes = { "markdown" } end,
    },
}
