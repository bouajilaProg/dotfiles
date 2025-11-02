vim.g.lazyvim_picker = "telescope"

-- plugin catpuccin
require("catppuccin").setup()
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
