-- ========================================
-- COLORSCHEME: DISABLED
-- ========================================
-- Colorscheme is now configured in modernist-theme.lua
-- To switch back to the old Ayu theme, comment out
-- modernist-theme.lua and uncomment the code below
-- ========================================

return {}

--[[
return {
	'Shatur/neovim-ayu',
	lazy = false,
	priority = 1000,
	config = function()
		require('ayu').setup({
			mirage = false,
			terminal = true,
			overrides = {
				Normal = { bg = "#0F131A" },
				NormalFloat = { bg = "#0F131A" },
				FloatBorder = { fg = "#5CCFE6", bg = "#0F131A" },
				CursorLine = { bg = "#1F2430" },
				CursorLineNr = { fg = "#FFD580", bold = true },
				Visual = { bg = "#273747" },
				IncSearch = { fg = "#0F131A", bg = "#FFCC66", bold = true },
				Search = { fg = "#0F131A", bg = "#5CCFE6" },
				Pmenu = { fg = "#CCCAC2", bg = "#1F2430" },
				PmenuSel = { fg = "#0F131A", bg = "#5CCFE6", bold = true },
				PmenuSbar = { bg = "#1F2430" },
				PmenuThumb = { bg = "#5CCFE6" },
				VertSplit = { fg = "#1F2430" },
				WinSeparator = { fg = "#1F2430" },
				StatusLine = { bg = "#1F2430" },
				StatusLineNC = { bg = "#0F131A" },
			},
		})
		vim.cmd('colorscheme ayu')
	end,
}
--]]
