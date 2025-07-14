vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.cursorline = true

vim.opt.scrolloff = 8

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.undodir = "~/.vim/undodir"

vim.opt.clipboard = 'unnamedplus'   -- use system clipboard

-- ========================================
-- SPLIT WINDOW SETTINGS
-- ========================================

-- Open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimum window width and height
vim.opt.winwidth = 20        -- Desired width for current window
vim.opt.winminwidth = 10     -- Minimum width for any window
vim.opt.winheight = 10       -- Desired height for current window  
vim.opt.winminheight = 1     -- Minimum height for any window

-- Keep equal sizes when resizing the terminal
vim.opt.equalalways = true

-- More natural split separators
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
})
