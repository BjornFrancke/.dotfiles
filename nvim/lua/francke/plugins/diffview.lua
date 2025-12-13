return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File history" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Branch history" },
		{ "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
	},
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			diff_binaries = false,
			enhanced_diff_hl = true,
			git_cmd = { "git" },
			hg_cmd = { "hg" },
			use_icons = true,
			show_help_hints = true,
			watch_index = true,

			icons = {
				folder_closed = "",
				folder_open = "",
			},

			signs = {
				fold_closed = "",
				fold_open = "",
				done = "✓",
			},

			view = {
				default = {
					layout = "diff2_horizontal",
					winbar_info = true,
				},
				merge_tool = {
					layout = "diff3_mixed",
					disable_diagnostics = true,
					winbar_info = true,
				},
				file_history = {
					layout = "diff2_horizontal",
					winbar_info = true,
				},
			},

			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
					win_opts = {},
				},
			},

			file_history_panel = {
				log_options = {
					git = {
						single_file = {
							diff_merges = "combined",
						},
						multi_file = {
							diff_merges = "first-parent",
						},
					},
				},
				win_config = {
					position = "bottom",
					height = 16,
					win_opts = {},
				},
			},

			commit_log_panel = {
				win_config = {
					win_opts = {},
				},
			},

			default_args = {
				DiffviewOpen = {},
				DiffviewFileHistory = {},
			},

			hooks = {
				diff_buf_read = function(bufnr)
					-- Disable some features in diff buffers
					vim.opt_local.wrap = false
					vim.opt_local.list = false
					vim.opt_local.colorcolumn = ""
				end,
				view_opened = function(view)
					-- Notify when diffview opens
					vim.notify("Diffview opened", vim.log.levels.INFO)
				end,
			},

			keymaps = {
				disable_defaults = false,
				view = {
					{ "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "Previous file" } },
					{ "n", "gf", actions.goto_file_edit, { desc = "Open file" } },
					{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle file panel" } },
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
				file_panel = {
					{ "n", "j", actions.next_entry, { desc = "Next entry" } },
					{ "n", "k", actions.prev_entry, { desc = "Previous entry" } },
					{ "n", "<cr>", actions.select_entry, { desc = "Select entry" } },
					{ "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
					{ "n", "S", actions.stage_all, { desc = "Stage all" } },
					{ "n", "U", actions.unstage_all, { desc = "Unstage all" } },
					{ "n", "X", actions.restore_entry, { desc = "Restore entry" } },
					{ "n", "L", actions.open_commit_log, { desc = "Open commit log" } },
					{ "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "Previous file" } },
					{ "n", "gf", actions.goto_file_edit, { desc = "Open file" } },
					{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle file panel" } },
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
				file_history_panel = {
					{ "n", "j", actions.next_entry, { desc = "Next entry" } },
					{ "n", "k", actions.prev_entry, { desc = "Previous entry" } },
					{ "n", "<cr>", actions.select_entry, { desc = "Select entry" } },
					{ "n", "o", actions.options, { desc = "Options" } },
					{ "n", "y", actions.copy_hash, { desc = "Copy commit hash" } },
					{ "n", "L", actions.open_commit_log, { desc = "Open commit log" } },
					{ "n", "zR", actions.open_all_folds, { desc = "Open all folds" } },
					{ "n", "zM", actions.close_all_folds, { desc = "Close all folds" } },
					{ "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "Previous file" } },
					{ "n", "gf", actions.goto_file_edit, { desc = "Open file" } },
					{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle file panel" } },
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
			},
		})
	end,
}
