return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local colors = {
			blue = "#36A3D9", -- tag.dark
			green = "#B8CC52", -- string.dark
			violet = "#95E6CB", -- regexp.dark
			yellow = "#FFB454", -- function.dark
			red = "#FF3333", -- error.dark
			fg = "#E6E1CF", -- fg.dark
			bg = "#0F1419", -- bg.dark
			inactive_bg = "#14191F", -- panel.dark
			semilightgray = "#5C6773", -- comment.dark
			gray = "#3E4B59", -- lighter gray for section b
			darkgray = "#1C232A", -- slightly lighter than bg for subtle contrast
		}

		-- Custom mode names
		local mode_map = {
			n = "NORMAL",
			i = "INSERT",
			v = "VISUAL",
			[""] = "V-BLOCK",
			V = "V-LINE",
			c = "COMMAND",
			R = "REPLACE",
			t = "TERMINAL",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.gray, fg = colors.fg },
				c = { bg = colors.darkgray, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.gray, fg = colors.fg },
				c = { bg = colors.darkgray, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.gray, fg = colors.fg },
				c = { bg = colors.darkgray, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.gray, fg = colors.fg },
				c = { bg = colors.darkgray, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.gray, fg = colors.fg },
				c = { bg = colors.darkgray, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- Diagnostics formatter
		local diagnostics_fmt = function(str, diagnostics_dict, context)
			local s = " "
			for name, count in pairs(diagnostics_dict) do
				local count_num = tonumber(count) or 0
				if count_num > 0 then
					if name == "error" then
						s = s .. "%#LualineDiagnosticError#" .. " " .. count .. " "
					elseif name == "warn" then
						s = s .. "%#LualineDiagnosticWarn#" .. " " .. count .. " "
					elseif name == "info" then
						s = s .. "%#LualineDiagnosticInfo#" .. " " .. count .. " "
					elseif name == "hint" then
						s = s .. "%#LualineDiagnosticHint#" .. " " .. count .. " "
					end
				end
			end
			return s
		end

		-- configure lualine with custom theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "NvimTree" },
					winbar = {},
				},
				globalstatus = true,
				refresh = {
					statusline = 800,
					tabline = 1000,
					winbar = 1000,
				},
				icons_enabled = true,
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = colors.violet, gui = "bold" },
						padding = { left = 2, right = 1 },
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						colored = true,
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
						},
						padding = { left = 1, right = 1 },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						fmt = diagnostics_fmt,
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.blue },
							hint = { fg = colors.green },
						},
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						icons_enabled = true,
						icon = "",
						color = { fg = colors.fg, gui = "bold" },
						file_status = true,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = " [New]",
						},
						padding = { left = 2, right = 1 },
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.yellow, gui = "bold" },
						icon = " ",
						padding = { left = 1, right = 1 },
					},
					{
						"encoding",
						fmt = function(str)
							return string.upper(str)
						end,
						color = { fg = colors.blue, gui = "italic" },
						padding = { left = 1, right = 1 },
					},
					{
						"fileformat",
						symbols = {
							unix = " UNIX",
							dos = " WIN",
							mac = " MAC",
						},
						color = { fg = colors.violet, gui = "italic" },
						padding = { left = 1, right = 1 },
					},
					{
						"filetype",
						colored = true,
						icon_only = true,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_y = {
					{
						"progress",
						icon = "",
						color = { fg = colors.yellow },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					{
						"location",
						icon = "",
						color = { fg = colors.bg, bg = colors.blue, gui = "bold" },
						padding = { left = 1, right = 1 },
						separator = { left = "", right = "" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = colors.semilightgray, gui = "italic" },
					},
				},
				lualine_x = {
					{
						"location",
						icon = "",
						color = { fg = colors.semilightgray },
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree", "fugitive", "mason", "lazy", "trouble" },
		})

		-- Define highlight groups for diagnostics in the statusline
		vim.api.nvim_set_hl(0, "LualineDiagnosticError", { fg = colors.red, bold = true })
		vim.api.nvim_set_hl(0, "LualineDiagnosticWarn", { fg = colors.yellow, bold = true })
		vim.api.nvim_set_hl(0, "LualineDiagnosticInfo", { fg = colors.blue, bold = true })
		vim.api.nvim_set_hl(0, "LualineDiagnosticHint", { fg = colors.green, bold = true })
	end,
}
