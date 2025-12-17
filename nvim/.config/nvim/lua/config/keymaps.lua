-- Accept Copilot suggestion with <C-l>
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- go back a word with shift + e
vim.api.nvim_set_keymap("n", "E", "b", { noremap = true })

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>w<Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Right>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })

-- delete
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
vim.keymap.set("n", "xx", "dd", { noremap = true, silent = true })
vim.keymap.set("n", "x", "<Nop>", { noremap = true, silent = true })

-- trouble
local trouble_maps = {
	{ "<leader>xx", "diagnostics toggle", "Diagnostics (Trouble)" },
	{ "<leader>xX", "diagnostics toggle filter.buf=0", "Buffer Diagnostics (Trouble)" },
	{ "<leader>cs", "symbols toggle focus=false", "Symbols (Trouble)" },
	{ "<leader>cl", "lsp toggle focus=false win.position=right", "LSP Definitions / references / ... (Trouble)" },
	{ "<leader>xL", "loclist toggle", "Location List (Trouble)" },
	{ "<leader>xQ", "qflist toggle", "Quickfix List (Trouble)" },
}

for _, map in ipairs(trouble_maps) do
	local key, cmd, desc = unpack(map)
	vim.keymap.set("n", key, "<cmd>Trouble " .. cmd .. "<cr>", { desc = desc })
end
