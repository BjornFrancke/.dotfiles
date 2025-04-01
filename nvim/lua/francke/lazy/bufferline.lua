return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or level:match("warning") and " " or ""
				return " " .. icon .. count
			end,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = false,
			always_show_bufferline = true,
			modified_icon = "●",
			tab_size = 20,
			padding = 1,
			indicator = {
				style = "none",
			},
			offsets = {
				{
					filetype = "NvimTree",
					text = "Files",
					text_align = "center",
					separator = true,
					padding = 1,
				},
			},
		},
		highlights = {
			fill = {
				bg = "#0F1419",
			},
			background = {
				fg = "#5C6773",
				bg = "#0F1419",
			},
			tab = {
				fg = "#5C6773",
				bg = "#0F1419",
			},
			tab_selected = {
				fg = "#E6E1CF",
				bg = "#14191F",
				bold = true,
			},
			tab_close = {
				fg = "#FF3333",
				bg = "#0F1419",
			},
			buffer_visible = {
				fg = "#5C6773",
				bg = "#0F1419",
			},
			buffer_selected = {
				fg = "#E6E1CF",
				bg = "#14191F",
				bold = true,
				italic = false,
			},
			modified = {
				fg = "#FFB454",
				bg = "#0F1419",
			},
			modified_selected = {
				fg = "#FFB454",
				bg = "#14191F",
			},
			duplicate = {
				fg = "#5C6773",
				bg = "#0F1419",
				italic = false,
			},
			separator = {
				fg = "#0F1419",
				bg = "#0F1419",
			},
			separator_selected = {
				fg = "#14191F",
				bg = "#14191F",
			},
			error = {
				fg = "#FF3333",
				bg = "#0F1419",
			},
			error_selected = {
				fg = "#FF3333",
				bg = "#14191F",
			},
			warning = {
				fg = "#FFB454",
				bg = "#0F1419",
			},
			warning_selected = {
				fg = "#FFB454",
				bg = "#14191F",
			},
			info = {
				fg = "#36A3D9",
				bg = "#0F1419",
			},
			info_selected = {
				fg = "#36A3D9",
				bg = "#14191F",
			},
			hint = {
				fg = "#B8CC52",
				bg = "#0F1419",
			},
			hint_selected = {
				fg = "#B8CC52",
				bg = "#14191F",
			},
		},
	},
}
