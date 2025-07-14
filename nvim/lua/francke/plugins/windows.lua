return {
    -- Better window focusing
    {
        'nvim-focus/focus.nvim',
        version = false,
        config = function()
            require("focus").setup({
                enable = true,
                commands = true,
                autoresize = {
                    enable = true,
                    width = 0,
                    height = 0,
                    minwidth = 0,
                    minheight = 0,
                    height_quickfix = 10,
                },
                split = {
                    bufnew = false,
                    tmux = false,
                },
                ui = {
                    number = false,
                    relativenumber = false,
                    hybridnumber = false,
                    absolutenumber_unfocused = false,
                    cursorline = true,
                    cursorcolumn = false,
                    colorcolumn = {
                        enable = false,
                    },
                    signcolumn = true,
                    winhighlight = false,
                }
            })

            -- Keymaps for Focus.nvim
            vim.keymap.set('n', '<leader>wh', ':FocusSplitLeft<CR>', { silent = true, desc = "Create split left" })
            vim.keymap.set('n', '<leader>wj', ':FocusSplitDown<CR>', { silent = true, desc = "Create split down" })
            vim.keymap.set('n', '<leader>wk', ':FocusSplitUp<CR>', { silent = true, desc = "Create split up" })
            vim.keymap.set('n', '<leader>wl', ':FocusSplitRight<CR>', { silent = true, desc = "Create split right" })
            vim.keymap.set('n', '<leader>ww', ':FocusSplitNicely<CR>', { silent = true, desc = "Create split nicely" })
            vim.keymap.set('n', '<leader>we', ':FocusEqualise<CR>', { silent = true, desc = "Equalise splits" })
            vim.keymap.set('n', '<leader>wm', ':FocusMaximise<CR>', { silent = true, desc = "Maximise split" })
        end
    },

    -- Smooth scrolling for better split navigation
    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
                hide_cursor = true,
                stop_eof = true,
                respect_scrolloff = false,
                cursor_scrolls_alone = true,
                easing_function = "quadratic",
                pre_hook = nil,
                post_hook = nil,
                performance_mode = false,
            })
        end
    }
} 