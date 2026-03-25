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


-- Check for file changes when:
-- - Entering a buffer
-- - Gaining focus
-- - After shell commands
-- - When cursor stops moving (CursorHold)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("AutoReload", { clear = true }),
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

-- Notify when file is reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    group = vim.api.nvim_create_augroup("AutoReloadNotify", { clear = true }),
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    end,
})

-- Show whitespace characters (subtle)
vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    trail = "·",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
}

