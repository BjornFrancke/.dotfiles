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
			-- Find operations
			{ "<leader>f", group = "[F]ind (Telescope)" },

						{ "<leader>b", group = "[B]uffers" },
			{ "<leader>d", group = "[D]iagnostics / debug" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>p", group = "[P]roject" },
		})
	end,
}
