return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "rounded",
				winblend = 0,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		-- Claude Code terminal
		local claude = Terminal:new({
			cmd = "claude",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "rounded",
				width = function()
					return math.floor(vim.o.columns * 0.85)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.85)
				end,
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				-- Close with q in normal mode
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
				-- Escape to normal mode (double escape since claude uses escape too)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", [[<C-\><C-n>]], { noremap = true, silent = true })
			end,
			on_close = function(_)
				vim.cmd("startinsert!")
			end,
		})

		-- Toggle Claude Code
		vim.keymap.set({ "n", "t" }, "<leader>ai", function()
			claude:toggle()
		end, { desc = "Toggle Claude Code" })

		-- Alternative: open Claude with current file context
		vim.keymap.set("n", "<leader>aI", function()
			local file = vim.fn.expand("%:p")
			local claude_with_file = Terminal:new({
				cmd = "claude --allowedTools 'Read,Grep,Glob' '@" .. file .. "'",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "rounded",
					width = function()
						return math.floor(vim.o.columns * 0.85)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.85)
					end,
				},
			})
			claude_with_file:toggle()
		end, { desc = "Claude Code with current file" })

		-- General floating terminal
		vim.keymap.set({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal" })

		-- Horizontal terminal at bottom
		vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })

		-- Vertical terminal on right
		vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })

		-- Better terminal navigation
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
