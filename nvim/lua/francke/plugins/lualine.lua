return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- Swiss Modernist theme for lualine
		local custom_theme = {
			normal = {
				a = { fg = "#0A0A0A", bg = "#E84A4A", gui = "bold" }, -- Swiss red
				b = { fg = "#E8E8E8", bg = "#1A1A1A" },
				c = { fg = "#909090", bg = "#0A0A0A" },
			},
			insert = { a = { fg = "#0A0A0A", bg = "#6090D0", gui = "bold" } },
			visual = { a = { fg = "#0A0A0A", bg = "#A060A0", gui = "bold" } },
			replace = { a = { fg = "#0A0A0A", bg = "#F0A020", gui = "bold" } },
			command = { a = { fg = "#0A0A0A", bg = "#50A0A0", gui = "bold" } },
			inactive = {
				a = { fg = "#909090", bg = "#1A1A1A" },
				b = { fg = "#909090", bg = "#0A0A0A" },
				c = { fg = "#909090", bg = "#0A0A0A" },
			},
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
				-- Swiss modernist separators - geometric, not rounded
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "▌", right = "▐" },
				disabled_filetypes = {
					statusline = { "NvimTree", "alpha", "dashboard" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = false, -- Asymmetric layout (Swiss style)
				globalstatus = true, -- Single statusline for all windows
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1) -- Show just first letter (N, I, V, etc.)
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true, -- Shows readonly, modified status
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						shorting_target = 40,
						symbols = {
							modified = " ●", -- Text to show when file is modified
							readonly = " ", -- Text to show when file is readonly
							unnamed = "[No Name]",
						},
					},
					{
						"diagnostics",
						sources = { "coc" }, -- Using CoC for diagnostics
						sections = { "error", "warn", "info", "hint" },
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
							info = "DiagnosticInfo",
							hint = "DiagnosticHint",
						},
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						colored = true,
						update_in_insert = false,
						always_visible = false,
					},
				},
				lualine_x = {
					{
						-- Show LSP status
						function()
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return ""
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return " " .. client.name
								end
							end
							-- Check for CoC
							if vim.g.coc_status then
								return " CoC"
							end
							return ""
						end,
						icon = "",
						color = { fg = "#7aa2f7" },
					},
					{
						"encoding",
						fmt = function(str)
							return str:upper()
						end,
					},
					{
						"fileformat",
						symbols = {
							unix = "LF",
							dos = "CRLF",
							mac = "CR",
						},
					},
					{
						"filetype",
						colored = true,
						icon_only = false,
					},
				},
				lualine_y = {
					{
						"progress",
					},
				},
				lualine_z = {
					{
						"location",
						icon = "",
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree", "lazy", "trouble", "quickfix" },
		})
	end,
}
