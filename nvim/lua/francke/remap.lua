local set = vim.opt

local defaults = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")

-- To filebrowser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy whole file
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- Move single-line
vim.keymap.set("n", "<C-j>", ":move .+1<CR>==", defaults)
vim.keymap.set("n", "<C-k>", ":move .-2<CR>==", defaults)

-- Move multi-line
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv", defaults)
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv", defaults)
