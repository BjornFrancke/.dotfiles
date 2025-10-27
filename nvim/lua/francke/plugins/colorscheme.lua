return {
	'Shatur/neovim-ayu',
	lazy = false,
	priority = 1000, -- Load colorscheme before other plugins
	config = function()
		require('ayu').setup({
			mirage = false, -- Use dark variant
			terminal = true, -- Apply colorscheme to terminal
			overrides = {
				-- Enhance visual elements to match modern aesthetics
				Normal = { bg = "#0F131A" }, -- Slightly darker background
				NormalFloat = { bg = "#0F131A" }, -- Match floating windows
				FloatBorder = { fg = "#5CCFE6", bg = "#0F131A" }, -- Cyan borders

				-- Better cursor line
				CursorLine = { bg = "#1F2430" },
				CursorLineNr = { fg = "#FFD580", bold = true },

				-- Better selection
				Visual = { bg = "#273747" },

				-- Better search
				IncSearch = { fg = "#0F131A", bg = "#FFCC66", bold = true },
				Search = { fg = "#0F131A", bg = "#5CCFE6" },

				-- Better completion menu
				Pmenu = { fg = "#CCCAC2", bg = "#1F2430" },
				PmenuSel = { fg = "#0F131A", bg = "#5CCFE6", bold = true },
				PmenuSbar = { bg = "#1F2430" },
				PmenuThumb = { bg = "#5CCFE6" },

				-- Better split separators
				VertSplit = { fg = "#1F2430" },
				WinSeparator = { fg = "#1F2430" },

				-- Better statusline integration
				StatusLine = { bg = "#1F2430" },
				StatusLineNC = { bg = "#0F131A" },
			},
		})
		vim.cmd('colorscheme ayu')
	end,
}
