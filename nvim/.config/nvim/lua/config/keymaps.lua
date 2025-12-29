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
vim.keymap.set({ "n", "v" }, "x", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "xx", '"_dd', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", "d", { noremap = true, silent = true })

-- pasting without overwriting clipboard
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true })
vim.api.nvim_set_keymap("v", "P", '"_dP', { noremap = true })

-- move lines up and down
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

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

-- buffer switch
vim.api.nvim_set_keymap("n", "<leader>b<Right>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b<Left>", ":bprevious<CR>", { noremap = true, silent = true })
