-- ========================================
-- CORE VIM SETTINGS
-- ========================================

-- Cursor and appearance
vim.opt.guicursor = ""              -- Use block cursor in all modes
vim.opt.number = true                -- Show line numbers
vim.opt.nu = true                    -- Show line numbers (alias)
vim.opt.relativenumber = true        -- Show relative line numbers (great for motions like 5j)
vim.opt.cursorline = true           -- Highlight current line

-- Indentation and tabs
vim.opt.tabstop = 4                 -- Tab width is 4 spaces
vim.opt.softtabstop = 4             -- Number of spaces for tab in insert mode
vim.opt.shiftwidth = 4              -- Number of spaces for auto-indent
vim.opt.expandtab = true            -- Convert tabs to spaces
vim.opt.smartindent = true          -- Smart auto-indenting on new lines

-- Scrolling and viewport
vim.opt.scrolloff = 8               -- Keep 8 lines visible above/below cursor

-- Search settings
vim.opt.hlsearch = false            -- Don't highlight search results after search
vim.opt.incsearch = true            -- Show search matches as you type

-- Colors
vim.opt.termguicolors = true        -- Enable 24-bit RGB color in the terminal

-- Persistent undo (undo changes even after closing and reopening file)
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
-- Create undodir if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

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
