-- Accept Copilot suggestion with <C-l>
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- go back a word with shift + e
vim.api.nvim_set_keymap("n", "E", "b", { noremap = true })
