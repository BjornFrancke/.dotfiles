-- ========================================
-- SWISS MODERNIST DESIGN SYSTEM
-- ========================================
-- Inspired by International Typographic Style
-- Characteristics:
-- - Grid-based layout
-- - Geometric precision
-- - Monochromatic with bold accent
-- - Mathematical proportions
-- - Emphasis on negative space
-- ========================================

return {
	-- Custom colorscheme override for Ayu with Swiss modernist principles
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			-- Swiss Modernist Color Palette
			-- Base: Monochromatic grays
			-- Accent: Swiss Red
			local colors = {
				-- Monochromatic base (Swiss style uses limited palette)
				black = "#0A0A0A",
				dark_gray = "#1A1A1A",
				medium_gray = "#2A2A2A",
				light_gray = "#909090",
				white = "#E8E8E8",

				-- Swiss Red - the signature accent
				swiss_red = "#E84A4A",
				red_dark = "#C23030",

				-- Functional colors (minimal, precise)
				warning = "#F0A020",
				error = "#E84A4A",
				info = "#909090",
				success = "#50A050",

				-- Code syntax (reduced palette for cleanliness)
				blue = "#6090D0",
				cyan = "#50A0A0",
				green = "#60A060",
				yellow = "#D0A050",
				magenta = "#A060A0",
			}

			require("ayu").setup({
				mirage = false,
				terminal = true,
				overrides = {
					-- Base colors - monochromatic
					Normal = { bg = colors.black, fg = colors.white },
					NormalFloat = { bg = colors.dark_gray, fg = colors.white },
					NormalNC = { bg = colors.black, fg = colors.light_gray },

					-- Strong geometric borders (Swiss precision)
					FloatBorder = { fg = colors.swiss_red, bg = colors.dark_gray },
					WinSeparator = { fg = colors.medium_gray, bg = "NONE" },
					VertSplit = { fg = colors.medium_gray, bg = "NONE" },

					-- Cursor and selection - Swiss red accent
					CursorLine = { bg = colors.dark_gray },
					CursorLineNr = { fg = colors.swiss_red, bold = true },
					LineNr = { fg = colors.light_gray },
					Visual = { bg = colors.medium_gray },

					-- Search - bold accent
					IncSearch = { fg = colors.black, bg = colors.swiss_red, bold = true },
					Search = { fg = colors.black, bg = colors.light_gray },

					-- Statusline - grid-based, asymmetric
					StatusLine = { fg = colors.white, bg = colors.dark_gray, bold = true },
					StatusLineNC = { fg = colors.light_gray, bg = colors.black },

					-- Completion menu - clean hierarchy
					Pmenu = { fg = colors.white, bg = colors.dark_gray },
					PmenuSel = { fg = colors.black, bg = colors.swiss_red, bold = true },
					PmenuSbar = { bg = colors.medium_gray },
					PmenuThumb = { bg = colors.swiss_red },

					-- Tabs - grid elements
					TabLine = { fg = colors.light_gray, bg = colors.dark_gray },
					TabLineFill = { bg = colors.black },
					TabLineSel = { fg = colors.black, bg = colors.swiss_red, bold = true },

					-- Signs and diagnostics - minimal, functional
					SignColumn = { bg = colors.black },
					DiagnosticError = { fg = colors.error },
					DiagnosticWarn = { fg = colors.warning },
					DiagnosticInfo = { fg = colors.info },
					DiagnosticHint = { fg = colors.light_gray },

					-- Git signs - subtle grid indicators
					DiffAdd = { fg = colors.success, bg = "NONE" },
					DiffChange = { fg = colors.warning, bg = "NONE" },
					DiffDelete = { fg = colors.error, bg = "NONE" },
					DiffText = { fg = colors.black, bg = colors.warning },

					-- Syntax - reduced palette (modernist restraint)
					Comment = { fg = colors.light_gray, italic = true },
					Constant = { fg = colors.white },
					String = { fg = colors.green },
					Character = { fg = colors.green },
					Number = { fg = colors.cyan },
					Boolean = { fg = colors.cyan },
					Float = { fg = colors.cyan },

					Identifier = { fg = colors.white },
					Function = { fg = colors.blue },

					Statement = { fg = colors.swiss_red, bold = true },
					Conditional = { fg = colors.swiss_red, bold = true },
					Repeat = { fg = colors.swiss_red, bold = true },
					Label = { fg = colors.swiss_red },
					Operator = { fg = colors.light_gray },
					Keyword = { fg = colors.swiss_red, bold = true },
					Exception = { fg = colors.error, bold = true },

					PreProc = { fg = colors.magenta },
					Include = { fg = colors.magenta },
					Define = { fg = colors.magenta },
					Macro = { fg = colors.magenta },
					PreCondit = { fg = colors.magenta },

					Type = { fg = colors.yellow },
					StorageClass = { fg = colors.yellow },
					Structure = { fg = colors.yellow },
					Typedef = { fg = colors.yellow },

					Special = { fg = colors.cyan },
					SpecialChar = { fg = colors.cyan },
					Tag = { fg = colors.swiss_red },
					Delimiter = { fg = colors.light_gray },
					SpecialComment = { fg = colors.light_gray, italic = true },
					Debug = { fg = colors.error },

					-- Markdown - typographic hierarchy
					["@markup.heading.1"] = { fg = colors.swiss_red, bold = true },
					["@markup.heading.2"] = { fg = colors.swiss_red },
					["@markup.heading.3"] = { fg = colors.white, bold = true },
					["@markup.strong"] = { bold = true },
					["@markup.italic"] = { italic = true },
					["@markup.link"] = { fg = colors.blue, underline = true },
					["@markup.list"] = { fg = colors.swiss_red },

					-- Modern UI elements
					-- Telescope (grid-based layout)
					TelescopeBorder = { fg = colors.swiss_red, bg = colors.dark_gray },
					TelescopeSelection = { fg = colors.black, bg = colors.swiss_red, bold = true },
					TelescopeSelectionCaret = { fg = colors.swiss_red, bg = colors.swiss_red },
					TelescopePromptPrefix = { fg = colors.swiss_red, bold = true },

					-- Which-key (clear hierarchy)
					WhichKey = { fg = colors.swiss_red, bold = true },
					WhichKeyGroup = { fg = colors.blue },
					WhichKeyDesc = { fg = colors.white },
					WhichKeySeparator = { fg = colors.light_gray },
					WhichKeyFloat = { bg = colors.dark_gray },
					WhichKeyBorder = { fg = colors.swiss_red, bg = colors.dark_gray },

					-- NvimTree (grid structure)
					NvimTreeNormal = { bg = colors.dark_gray },
					NvimTreeNormalNC = { bg = colors.dark_gray },
					NvimTreeRootFolder = { fg = colors.swiss_red, bold = true },
					NvimTreeFolderName = { fg = colors.white },
					NvimTreeFolderIcon = { fg = colors.swiss_red },
					NvimTreeOpenedFolderName = { fg = colors.swiss_red },
					NvimTreeSymlink = { fg = colors.cyan },
					NvimTreeGitDirty = { fg = colors.warning },
					NvimTreeGitNew = { fg = colors.success },
					NvimTreeGitDeleted = { fg = colors.error },
					NvimTreeSpecialFile = { fg = colors.swiss_red },
					NvimTreeIndentMarker = { fg = colors.medium_gray },

					-- Noice (minimal notifications)
					NoiceCmdlinePopup = { bg = colors.dark_gray },
					NoiceCmdlinePopupBorder = { fg = colors.swiss_red, bg = colors.dark_gray },
					NoiceCmdlineIcon = { fg = colors.swiss_red },
				},
			})
			vim.cmd("colorscheme ayu")
		end,
	},
}
