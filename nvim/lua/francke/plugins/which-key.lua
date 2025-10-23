return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "modern",
			delay = 500, -- Delay before showing the popup (ms)
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20,
				},
			},
			win = {
				border = "rounded",
			},
		})

		-- Document existing key chains
		wk.add({
			-- File operations
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>ff", desc = "Find files" },
			{ "<leader>fa", desc = "Find all files (including ignored)" },
			{ "<leader>fg", desc = "Live grep" },
			{ "<leader>fb", desc = "Find buffers" },
			{ "<leader>fh", desc = "Help tags" },
			{ "<leader>fo", desc = "Recent files" },
			{ "<leader>fw", desc = "Find word under cursor" },
			{ "<leader>fG", desc = "Git files" },
			{ "<leader>fc", desc = "Git commits" },
			{ "<leader>fC", desc = "Git buffer commits" },
			{ "<leader>fs", desc = "Document symbols" },
			{ "<leader>fS", desc = "Workspace symbols" },
			{ "<leader>fd", desc = "Diagnostics" },
			{ "<leader>f/", desc = "Search in open buffers" },
			{ "<leader>fr", desc = "Resume last picker" },
			{ "<leader>fk", desc = "Keymaps" },
			{ "<leader>fm", desc = "Marks" },
			{ "<leader>fj", desc = "Jumplist" },
			{ "<leader>fq", desc = "Quickfix list" },
			{ "<leader>/", desc = "Fuzzy search current buffer" },

			-- Split window management
			{ "<leader>s", group = "Splits" },
			{ "<leader>sv", desc = "Split vertical" },
			{ "<leader>sh", desc = "Split horizontal" },
			{ "<leader>se", desc = "Equal splits" },
			{ "<leader>sx", desc = "Close split" },
			{ "<leader>ss", desc = "Split current buffer" },
			{ "<leader>so", desc = "Close other splits (focus)" },
			{ "<leader>sw", desc = "Swap to next window" },
			{ "<leader>st", desc = "Toggle split orientation" },
			{ "<leader>sH", desc = "Move split left" },
			{ "<leader>sL", desc = "Move split right" },
			{ "<leader>sK", desc = "Move split up" },
			{ "<leader>sJ", desc = "Move split down" },
			{ "<leader>s+", desc = "Increase height" },
			{ "<leader>s-", desc = "Decrease height" },
			{ "<leader>s<", desc = "Decrease width" },
			{ "<leader>s>", desc = "Increase width" },

			-- Git operations (gitsigns)
			{ "<leader>h", group = "Git Hunks" },
			{ "<leader>hs", desc = "Stage hunk" },
			{ "<leader>hr", desc = "Reset hunk" },
			{ "<leader>hS", desc = "Stage buffer" },
			{ "<leader>hR", desc = "Reset buffer" },
			{ "<leader>hp", desc = "Preview hunk" },
			{ "<leader>hi", desc = "Preview hunk inline" },
			{ "<leader>hb", desc = "Blame line" },
			{ "<leader>hd", desc = "Diff this" },
			{ "<leader>hD", desc = "Diff this ~" },
			{ "<leader>hq", desc = "Quickfix list" },
			{ "<leader>hQ", desc = "Quickfix list (all)" },

			-- LazyGit
			{ "<leader>lg", desc = "LazyGit" },

			-- Code actions (CoC)
			{ "<leader>a", group = "Code Actions" },
			{ "<leader>ac", desc = "Code action cursor" },
			{ "<leader>as", desc = "Code action source" },
			{ "<leader>qf", desc = "Quick fix" },
			{ "<leader>rn", desc = "Rename" },
			{ "<leader>re", desc = "Refactor" },
			{ "<leader>r", desc = "Refactor selected" },

			-- Toggles
			{ "<leader>t", group = "Toggle" },
			{ "<leader>tb", desc = "Toggle git blame" },
			{ "<leader>tw", desc = "Toggle word diff" },

			-- Diagnostics (Trouble)
			{ "<leader>x", group = "Diagnostics (Trouble)" },
			{ "<leader>xx", desc = "Toggle diagnostics" },
			{ "<leader>xX", desc = "Buffer diagnostics" },
			{ "<leader>xs", desc = "Symbols" },
			{ "<leader>xl", desc = "LSP definitions/references" },
			{ "<leader>xL", desc = "Location list" },
			{ "<leader>xq", desc = "Quickfix list" },
			{ "]x", desc = "Next trouble item" },
			{ "[x", desc = "Previous trouble item" },

			-- File Explorer (nvim-tree)
			{ "<leader>e", group = "Explorer" },
			{ "<leader>e", desc = "Toggle file explorer" },
			{ "<leader>ef", desc = "Focus file explorer" },
			{ "<leader>ec", desc = "Find current file in explorer" },
			{ "<leader>eC", desc = "Collapse file explorer" },
			{ "<D-b>", desc = "Toggle file explorer (Cmd+b)" },

			-- Harpoon
			{ "<leader>1", desc = "Harpoon file 1" },
			{ "<leader>2", desc = "Harpoon file 2" },
			{ "<leader>3", desc = "Harpoon file 3" },
			{ "<leader>4", desc = "Harpoon file 4" },

			-- File explorer (Oil)
			{ "<leader>pv", desc = "File explorer (Oil)" },
			{ "-", desc = "Open parent directory" },
			{ "<leader>-", desc = "Open parent directory (float)" },

			-- Navigate between splits
			{ "<C-h>", desc = "Go to left split" },
			{ "<C-l>", desc = "Go to right split" },
			{ "<C-k>", desc = "Go to upper split" },
			{ "<C-j>", desc = "Go to lower split" },

			-- Comments (Comment.nvim)
			{ "gc", group = "Comment" },
			{ "gcc", desc = "Toggle line comment" },
			{ "gbc", desc = "Toggle block comment" },
			{ "gcO", desc = "Comment line above" },
			{ "gco", desc = "Comment line below" },
			{ "gcA", desc = "Comment end of line" },
			{ "gb", desc = "Block comment" },

			-- Surround (mini.surround)
			{ "gs", group = "Surround" },
			{ "gsa", desc = "Add surrounding" },
			{ "gsd", desc = "Delete surrounding" },
			{ "gsf", desc = "Find surrounding (right)" },
			{ "gsF", desc = "Find surrounding (left)" },
			{ "gsh", desc = "Highlight surrounding" },
			{ "gsr", desc = "Replace surrounding" },
			{ "gsn", desc = "Update n_lines" },

			-- Buffer management
			{ "<leader>b", group = "Buffers" },
			{ "<leader>bd", desc = "Delete buffer" },
			{ "<leader>bD", desc = "Force delete buffer / Close all" },
			{ "<leader>bo", desc = "Close all other buffers" },
			{ "<S-h>", desc = "Previous buffer" },
			{ "<S-l>", desc = "Next buffer" },
			{ "[b", desc = "Previous buffer" },
			{ "]b", desc = "Next buffer" },

			-- Flash motions
			{ "s", desc = "Flash jump", mode = { "n", "x", "o" } },
			{ "S", desc = "Flash Treesitter", mode = { "n", "x", "o" } },
			{ "r", desc = "Remote Flash", mode = "o" },
			{ "R", desc = "Treesitter Search", mode = { "o", "x" } },
		})
	end,
}
