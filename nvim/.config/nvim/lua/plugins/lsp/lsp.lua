-- this folder is for configuring language servers of lspconfig

-- web
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")

-- python
vim.lsp.enable("pylsp")

-- utils
vim.lsp.enable("jsonls")
vim.lsp.enable("yamlls")

-- other
vim.lsp.enable("copilot")

return {}
