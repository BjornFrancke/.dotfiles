-- Hint: use `:h <option>` to figure out the meaning if needed
local set = vim.opt

set.clipboard = 'unnamedplus' -- use system clipboard
set.completeopt = { 'menu', 'menuone', 'noselect' }
set.mouse = 'a'               -- allow the mouse to be used in nvim
-- Indentation and tabs
vim.opt.tabstop = 4           -- Tab width is 4 spaces
vim.opt.softtabstop = 4       -- Number of spaces for tab in insert mode
vim.opt.shiftwidth = 4        -- Number of spaces for auto-indent
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.smartindent = true
set.number = true
set.cursorline = true

set.showmode = false

-- Automatically reload files when changed externally (e.g., by Claude Code, git, etc.)
set.autoread = true

-- Show whitespace characters (subtle)
vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    trail = "·",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
}

