require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins.color" },
		{ import = "plugins.core" },
		{ import = "plugins.editor" },
		{ import = "plugins.lsp" },
		{ import = "plugins.utils" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("config.setup")
