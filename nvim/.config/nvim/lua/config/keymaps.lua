-- Accept Copilot suggestion with <C-l>
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- go back a word with shift + e
vim.api.nvim_set_keymap("n", "E", "b", { noremap = true })

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>w<Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w<Right>", "<C-w>l", { noremap = true, silent = true })

