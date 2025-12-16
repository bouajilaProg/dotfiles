return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- combine default and extra languages
			local languages = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"vim",
				"yaml",
				"tsx",
				"typescript",
			}

			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, languages)
		end,
	},
}
