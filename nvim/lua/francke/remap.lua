local keymap = vim.keymap -- for conciseness
require("telescope.builtin")
require("which-key").add({

	{ "<leader>f", group = "file" }, -- group
	{ "<leader>e", group = "explore" }, -- group
})

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

--keymap.set("n", "<leader>pv", "<cmd>Exit<CR>", { desc = "Go Back" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "comment" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("", "<C-a>", "gg0vG$", { noremap = true, desc = "Select all" })
keymap.set({ "v", "i" }, "<C-a>", "<Esc>gg0vG$", { noremap = true, desc = "Select all" })

-- Move lines
keymap.set("n", "<A-j>", "<Cmd>move+1<CR>==", { noremap = true, desc = "Move line down" })
keymap.set("n", "<A-k>", "<Cmd>move-2<CR>==", { noremap = true, desc = "Move line up" })
keymap.set("i", "<A-j>", "<Esc><Cmd>move+1<CR>==gi", { noremap = true, desc = "Move line down" })
keymap.set("i", "<A-k>", "<Esc><Cmd>move-2<CR>==gi", { noremap = true, desc = "Move line up" })
keymap.set("v", "<A-j>", "<Esc><Cmd>'<,'>move'>+1<CR>gv=gv", { noremap = true, desc = "Move lines down" })
keymap.set("v", "<A-k>", "<Esc><Cmd>'<,'>move'<-2<CR>gv=gv", { noremap = true, desc = "Move lines up" })
