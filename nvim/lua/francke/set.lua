-- ========================================
-- CORE VIM SETTINGS
-- ========================================

-- Suppress deprecation warnings from plugins (they'll be fixed by plugin authors)
-- This prevents spam from plugins using old API functions
vim.deprecate = function() end

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
-- UI ENHANCEMENTS
-- ========================================

-- Better command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum" -- Show completion in popup menu

-- Show effects of commands incrementally (like :s/foo/bar)
vim.opt.inccommand = "split"

-- Better completion experience
vim.opt.completeopt = "menu,menuone,noselect"

-- Show current line, column in ruler
vim.opt.ruler = true

-- Shorter messages
vim.opt.shortmess:append("c")

-- Better display for messages
vim.opt.cmdheight = 1

-- Don't show mode (lualine shows it)
vim.opt.showmode = false

-- Better floating window borders
vim.diagnostic.config({
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Set border for hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- Better signcolumn
vim.opt.signcolumn = "yes" -- Always show sign column (prevents text shifting)

-- Smooth horizontal scrolling
vim.opt.sidescrolloff = 8

-- Better diff options
vim.opt.diffopt:append("vertical")

-- Show whitespace characters (subtle)
vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "·",
	extends = "›",
	precedes = "‹",
	nbsp = "␣",
}

-- Better fold settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- Don't fold by default
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

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
