return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "coc", -- shows diagnostics in tabs
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				-- Offset for nvim-tree
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "thin",
				always_show_bufferline = true,
				-- Hover for close
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		})

		-- Keymaps for buffer navigation
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

		-- Move buffers in the tabline
		vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

		-- Pick buffer by letter
		vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })

		-- Close buffer to the right/left
		vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
		vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
	end,
}
