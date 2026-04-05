----------------------------------
-- OPTION.LUA
----------------------------------

-- Hint: use `:h <option>` to figure out the meaning if needed
local set = vim.opt

set.clipboard = "unnamedplus" -- use system clipboard
set.completeopt = { "menu", "menuone", "noselect" }
set.mouse = "a" -- allow the mouse to be used in nvim
-- Indentation and tabs
vim.opt.tabstop = 4 -- Tab width is 4 spaces
vim.opt.softtabstop = 4 -- Number of spaces for tab in insert mode
vim.opt.shiftwidth = 4 -- Number of spaces for auto-indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true

-- Editor UI
set.number = true
set.cursorline = true
set.showmatch = true -- Show matching brackets/parenthesis:w

-- Number of screen lines to keep above & below the cursorline
set.scrolloff = 8

set.showmode = false

-- Automatically reload files when changed externally (e.g., by Claude Code, git, etc.)
set.autoread = true

-- Show whitespace characters (subtle)
set.list = true
set.listchars = {
	tab = "  ",
	trail = "·",
	extends = "›",
	precedes = "‹",
	nbsp = "␣",
}

set.inccommand = "split"

-- Search settings
set.hlsearch = false
set.incsearch = true
set.smartcase = true
set.ignorecase = true

-- Window title
set.title = true
set.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

set.backup = false
set.writebackup = false
set.swapfile = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- Buffer splitting
set.splitright = true
set.splitbelow = true
