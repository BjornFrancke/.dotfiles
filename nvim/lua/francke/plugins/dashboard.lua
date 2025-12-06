return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

        -- Swiss Modernist ASCII Art
        -- Geometric, grid-based, minimal
        dashboard.section.header.val = {
            [[                                                    ]],
            [[  ╔══════════════════════════════════════════════╗  ]],
            [[  ║                                              ║  ]],
            [[  ║    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗      ║  ]],
            [[  ║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║      ║  ]],
            [[  ║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║      ║  ]],
            [[  ║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝      ║  ]],
            [[  ║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝       ║  ]],
            [[  ║    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝        ║  ]],
            [[  ║                                              ║  ]],
            [[  ╚══════════════════════════════════════════════╝  ]],
            [[                                                    ]],
            [[                  FRANCKE EDITION                   ]],
            [[                                                    ]],
        }

		-- Menu buttons with clean typography
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
			dashboard.button("s", "  Restore session", ":source Session.vim<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- Footer with clean, minimal text
		local function footer()
			local datetime = os.date(" %Y-%m-%d  %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "  v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return datetime .. " │ " .. nvim_version_info
		end

		dashboard.section.footer.val = footer()

		-- Apply Swiss modernist colors
		dashboard.section.header.opts.hl = "DashboardHeader"
		dashboard.section.buttons.opts.hl = "DashboardCenter"
		dashboard.section.footer.opts.hl = "DashboardFooter"

		-- Layout with mathematical proportions (golden ratio influence)
		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Custom highlight groups for Swiss theme
		-- Accent color (matches modernist-theme.lua)
		local accent = "#4A9EFF"  -- Electric Blue - change this to match your theme!

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				vim.api.nvim_set_hl(0, "DashboardHeader", { fg = accent, bold = true }) -- Your accent color
				vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#E8E8E8" }) -- White
				vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#909090", italic = true }) -- Gray
			end,
		})

		alpha.setup(dashboard.config)
	end,
}
