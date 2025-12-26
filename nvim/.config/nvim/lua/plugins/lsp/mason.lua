return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"vtsls",
			},
		},

		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						border = "rounded",
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
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
					},
				},
			},

			"neovim/nvim-lspconfig",
		},
	},
}
