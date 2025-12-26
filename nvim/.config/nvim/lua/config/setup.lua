-- plugin catpuccin
vim.cmd.colorscheme("catppuccin")

require("telescope").setup({
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = {
			bottom_pane = {
				height = 0.4, -- Adjust the height as needed
			},
		},
		theme = "ivy", -- Apply the Ivy theme globally
	},
})
vim.g.lazyvim_picker = "telescope"

-- web
vim.lsp.enable("html")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")
vim.lsp.enable("vtsls")

-- python
vim.lsp.enable("pylsp")

-- utils
vim.lsp.enable("jsonls")
vim.lsp.enable("yamlls")

-- other
vim.lsp.enable("copilot")
