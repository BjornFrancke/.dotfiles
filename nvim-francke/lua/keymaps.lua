local defaults = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}


vim.g.mapleader = " "

-- Exit file
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, defaults)

-- Yank whole file
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", defaults)

-- Move single-line 
vim.keymap.set("n", "<D-j>", ":move .+1<CR>==", defaults)
vim.keymap.set("n", "<D-k>", ":move .-2<CR>==", defaults)

-- Move multi-line 
vim.keymap.set("v", "<D-j>", ":move '>+1<CR>gv=gv", defaults)
vim.keymap.set("v", "<D-k>", ":move '<-2<CR>gv=gv", defaults)

local tele = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', tele.find_files)
vim.keymap.set('n', '<leader>fg', tele.live_grep)
