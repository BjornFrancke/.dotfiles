return {
	"numToStr/Comment.nvim",
	opts = {
		pre_hook = function()
			if vim.bo.filetype == "yaml.ansible" then
				return "# %s"
			end

			if vim.bo.filetype == "env" then
				return "# %s"
			end
		end,
	},
}
