return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			focus_on_close = "previous",

			-- Exclude quickfix and other special buffers
			exclude_ft = { "qf" },
			exclude_name = { "package.json" },

			-- Icons
			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Diagnostics
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = false },
				},
				gitsigns = {
					added = { enabled = false },
					changed = { enabled = false },
					deleted = { enabled = false },
				},
				filetype = {
					custom_colors = false,
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				separator_at_end = true,
				modified = { button = "●" },
				pinned = { button = "󰐃", filename = true },
				preset = "default",
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = false },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},

			-- Insert new buffers after current
			insert_at_end = false,
			insert_at_start = false,

			-- Max padding
			maximum_padding = 1,
			minimum_padding = 1,
			maximum_length = 24,
			minimum_length = 0,

			-- No sidebar offset (NvimTree is on the right)
			sidebar_filetypes = {},

			-- Letters for buffer-pick mode
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
		})

		-- Keymaps
		vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<leader>bn", "<cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
		vim.keymap.set("n", "<leader>bb", "<cmd>BufferPick<CR>", { desc = "Pick buffer" })
		vim.keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
		vim.keymap.set("n", "<leader>br", "<cmd>BufferCloseBuffersRight<CR>", { desc = "Close buffers to the right" })
		vim.keymap.set("n", "<leader>bl", "<cmd>BufferCloseBuffersLeft<CR>", { desc = "Close buffers to the left" })
		vim.keymap.set("n", "<leader>bD", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all but current" })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferPin<CR>", { desc = "Pin buffer" })

		-- Ayu-matched highlights
		local colors = {
			bg = "#0b0e14",
			bg_tab = "#0d1017",
			bg_selected = "#1a1f29",
			fg = "#bfbdb6",
			fg_dim = "#565b66",
			accent = "#e6b450",
			accent_alt = "#ffb454",
			red = "#f07178",
			green = "#aad94c",
		}

		-- Set barbar highlight groups
		vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = colors.bg })
		vim.api.nvim_set_hl(0, "BufferCurrent", { fg = colors.fg, bg = colors.bg_selected, bold = true })
		vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = colors.accent, bg = colors.bg_selected })
		vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = colors.accent_alt, bg = colors.bg_selected })
		vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = colors.accent, bg = colors.bg_selected })
		vim.api.nvim_set_hl(0, "BufferCurrentTarget", { fg = colors.red, bg = colors.bg_selected, bold = true })
		vim.api.nvim_set_hl(0, "BufferCurrentIcon", { bg = colors.bg_selected })
		vim.api.nvim_set_hl(0, "BufferVisible", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = colors.accent_alt, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferVisibleTarget", { fg = colors.red, bg = colors.bg_tab, bold = true })
		vim.api.nvim_set_hl(0, "BufferInactive", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = colors.accent_alt, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = colors.fg_dim, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferInactiveTarget", { fg = colors.red, bg = colors.bg_tab, bold = true })
		vim.api.nvim_set_hl(0, "BufferOffset", { fg = colors.fg, bg = colors.bg })
		-- Pinned buffer highlights
		vim.api.nvim_set_hl(0, "BufferCurrentPin", { fg = colors.accent, bg = colors.bg_selected })
		vim.api.nvim_set_hl(0, "BufferVisiblePin", { fg = colors.accent, bg = colors.bg_tab })
		vim.api.nvim_set_hl(0, "BufferInactivePin", { fg = colors.accent, bg = colors.bg_tab })
	end,
}
