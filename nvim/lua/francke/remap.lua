-- ========================================
-- CUSTOM KEYBINDINGS
-- ========================================
-- Leader key is SPACE. Press SPACE and wait to see which-key popup with all options.
--
-- Quick reference:
-- BASIC:
--   jk (insert mode)    : Exit to normal mode
--   Cmd+b               : Toggle sidebar file explorer (nvim-tree)
--   <leader>e           : Toggle sidebar (alternative to Cmd+b)
--   -                   : Open parent directory (Oil)
--   <leader>pv          : Open file explorer (Oil)
--
-- FINDING (Telescope):
--   <leader>ff          : Find files
--   <leader>fg          : Live grep (search in files)
--   <leader>fb          : Find buffers
--   <leader>fo          : Recent files
--   <leader>/           : Search current buffer
--
-- BUFFERS:
--   Shift+h / Shift+l   : Previous/next buffer
--   <leader>bd          : Delete buffer
--   <leader>bo          : Close all other buffers
--
-- SPLITS:
--   <leader>sv/sh       : Create vertical/horizontal split
--   Ctrl+h/j/k/l        : Navigate between splits
--   <leader>sx          : Close current split
--
-- CODE:
--   gcc                 : Toggle line comment
--   gd                  : Go to definition
--   gr                  : Go to references
--   K                   : Show documentation
--   <leader>rn          : Rename symbol
--
-- DIAGNOSTICS:
--   <leader>xx          : Toggle diagnostics (Trouble)
--   ]x / [x             : Next/previous diagnostic
--
-- MOTIONS:
--   s                   : Flash jump (type chars to jump anywhere)
--   S                   : Flash treesitter (jump to code structures)
-- ========================================

local set = vim.opt

local defaults = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Quick escape from insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- To filebrowser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy whole file
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- Move single-line 
vim.keymap.set("n", "<D-j>", ":move .+1<CR>==", defaults)
vim.keymap.set("n", "<D-k>", ":move .-2<CR>==", defaults)

-- Move multi-line 
vim.keymap.set("v", "<D-j>", ":move '>+1<CR>gv=gv", defaults)
vim.keymap.set("v", "<D-k>", ":move '<-2<CR>gv=gv", defaults)

-- ========================================
-- SPLIT WINDOW MANAGEMENT
-- ========================================

-- Create splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Navigate between splits using Ctrl + hjkl (more intuitive than Ctrl-w + hjkl)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })

-- Resize splits using arrow keys
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase split height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease split height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })

-- Alternative resize with leader key (more discoverable)
vim.keymap.set("n", "<leader>s+", ":resize +5<CR>", { desc = "Increase split height" })
vim.keymap.set("n", "<leader>s-", ":resize -5<CR>", { desc = "Decrease split height" })
vim.keymap.set("n", "<leader>s<", ":vertical resize -5<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<leader>s>", ":vertical resize +5<CR>", { desc = "Increase split width" })

-- Move splits around
vim.keymap.set("n", "<leader>sH", "<C-w>H", { desc = "Move split to left" })
vim.keymap.set("n", "<leader>sL", "<C-w>L", { desc = "Move split to right" })
vim.keymap.set("n", "<leader>sK", "<C-w>K", { desc = "Move split to top" })
vim.keymap.set("n", "<leader>sJ", "<C-w>J", { desc = "Move split to bottom" })

-- Toggle between vertical and horizontal split
vim.keymap.set("n", "<leader>st", function()
    local win_count = vim.fn.winnr('$')
    if win_count == 2 then
        if vim.fn.winwidth(0) > vim.fn.winheight(0) * 2.5 then
            vim.cmd('wincmd K') -- Change to horizontal split
        else
            vim.cmd('wincmd H') -- Change to vertical split
        end
    else
        vim.notify("Split toggle works best with exactly 2 windows", vim.log.levels.INFO)
    end
end, { desc = "Toggle split orientation" })

-- Quick swap between two splits
vim.keymap.set("n", "<leader>sw", "<C-w>w", { desc = "Swap to next window" })

-- Open current buffer in new split
vim.keymap.set("n", "<leader>ss", "<cmd>vsplit<CR>", { desc = "Split current buffer vertically" })

-- Focus on current split (alternative to maximize)
vim.keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Close all other splits (focus current)" })

-- ========================================
-- BUFFER MANAGEMENT
-- ========================================

-- Navigate buffers (vim-native approach, no UI chrome)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })

-- Close buffers
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", { desc = "Force delete buffer" })

-- Close all buffers except current
vim.keymap.set("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if buf ~= current and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { desc = "Close all other buffers" })

-- Close all buffers
vim.keymap.set("n", "<leader>bD", function()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { desc = "Close all buffers" })

-- Quick buffer picker via Telescope (already configured in telescope.lua)
-- <leader>fb is mapped to telescope.builtin.buffers
