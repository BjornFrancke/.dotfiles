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

local tele = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", tele.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", tele.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fh", tele.help_tags, { desc = "[F]ind by [H]elp tags" })
vim.keymap.set("n", "<leader>fw", tele.grep_string, { desc = "Find word under cursor" })
vim.keymap.set("n", "<leader>fb", tele.buffers, { desc = "[F]ind [B]uffers" })

-- Mimic Shell movements
vim.keymap.set("i", "<C-E>", "<ESC>A", defaults)
vim.keymap.set("i", "<C-A>", "<ESC>I", defaults)

vim.keymap.set("n", "<C-N>", ":bn<CR>", defaults)
vim.keymap.set("n", "<C-P>", ":bp<CR>", defaults)

-- open work dir in Finder.app 
-- Thanks @mikker
vim.keymap.set("n", "<leader>O", ":call system('open .')<cr>", { desc = "Open cwd in Finder" })
