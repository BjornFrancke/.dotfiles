return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = '  Apps',
                        group = 'DiagnosticHint',
                        action = 'Telescope oldfiles',
                        key = 'a',
                    },
                    {
                        desc = ' dotfiles',
                        group = 'Number',
                        action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.expand("~/dotfiles") })',
                        key = 'd',
                    },
                },
            },

        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
