return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local i = require("utils.icons")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "ayu", -- Matches your Ayu colorscheme
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
						sources = { "nvim_lsp" },
						sections = { "error", "warn", "info", "hint" },
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
							info = "DiagnosticInfo",
							hint = "DiagnosticHint",
						},
						symbols = { error = i.diagnostics.error, warn = i.diagnostics.warning, info = " ", hint = " " },
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
