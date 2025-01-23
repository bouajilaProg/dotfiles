return {
	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"rust-analyzer",
				"bash-language-server",
				"python-lsp-server",
				-- web
				"html-lsp",
				"tailwindcss-language-server",
				"css-lsp",
				"typescript-language-server",
				"intelephense",
			},
		},
	},
}
