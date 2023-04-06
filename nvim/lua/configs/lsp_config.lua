local map = vim.api.nvim_set_keymap
map('n', '<Space>', '', {})
vim.g.mapleader = ' '
local options = { noremap = true }

local on_attach = function(client, bufnnr)
    map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', options)
    map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', options)
    map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', options)
    map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', options)
    map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', options)
    map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', options)
    map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', options)
    map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', options)
    map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', options)
    map('n', '<leader>ft', ':lua vim.lsp.buf.format(async)<cr>', options)
    map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', options)
    map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', options)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['yamlls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
