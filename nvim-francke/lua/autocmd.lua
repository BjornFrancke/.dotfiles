vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
    end,
})

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
