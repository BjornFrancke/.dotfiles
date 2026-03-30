
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
					custom_colors = true,
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

		-- Derive barbar colors from active colorscheme highlight groups
		local function get_hl_color(group, attr)
			local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
			if hl[attr] then
				return string.format("#%06x", hl[attr])
			end
			return nil
		end

		local function set_barbar_highlights()
			-- Pull colors from the active colorscheme
			local bg = get_hl_color("Normal", "bg") or "#0b0e14"
			local fg = get_hl_color("Normal", "fg") or "#bfbdb6"
			local fg_dim = get_hl_color("Comment", "fg") or "#565b66"
			local accent = get_hl_color("Function", "fg") or "#e6b450"
			local accent_alt = get_hl_color("Type", "fg") or "#ffb454"
			local red = get_hl_color("DiagnosticError", "fg") or "#f07178"
			local bg_tab = bg
			local bg_selected = get_hl_color("CursorLine", "bg") or bg

			-- Override TabLineFill to remove reverse (which causes a light background)
			vim.api.nvim_set_hl(0, "TabLineFill", { bg = bg, fg = fg_dim })
			vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = bg })
			vim.api.nvim_set_hl(0, "BufferCurrent", { fg = fg, bg = bg_selected, bold = true })
			vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = accent, bg = bg_selected })
			vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = accent_alt, bg = bg_selected })
			vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = accent, bg = bg_selected })
			vim.api.nvim_set_hl(0, "BufferCurrentTarget", { fg = red, bg = bg_selected, bold = true })
			vim.api.nvim_set_hl(0, "BufferCurrentIcon", { bg = bg_selected })
			vim.api.nvim_set_hl(0, "BufferVisible", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = accent_alt, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferVisibleTarget", { fg = red, bg = bg_tab, bold = true })
			vim.api.nvim_set_hl(0, "BufferInactive", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = accent_alt, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = fg_dim, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferInactiveTarget", { fg = red, bg = bg_tab, bold = true })
			vim.api.nvim_set_hl(0, "BufferOffset", { fg = fg, bg = bg })
			-- Pinned buffer highlights
			vim.api.nvim_set_hl(0, "BufferCurrentPin", { fg = accent, bg = bg_selected })
			vim.api.nvim_set_hl(0, "BufferVisiblePin", { fg = accent, bg = bg_tab })
			vim.api.nvim_set_hl(0, "BufferInactivePin", { fg = accent, bg = bg_tab })
		end

		-- Apply now and re-apply whenever the colorscheme changes
		set_barbar_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("BarbarHighlights", { clear = true }),
			callback = set_barbar_highlights,
		})
	end,
}
