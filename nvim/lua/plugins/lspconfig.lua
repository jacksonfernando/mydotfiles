return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim"
        },
        config = function()
            require("mason-lspconfig").setup {
                automatic_enable = false
            }
            local map = vim.api.nvim_set_keymap
            map('n', '<Space>', '', {})
            vim.g.mapleader = ' '
            local options = { noremap = true }

            local on_attach = function(client, bufnnr)
                map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', options)
                map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', options)
                map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', options)
                map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', options)
                map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', options)
                map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', options)
                map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', options)
                map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', options)
                map('n', '<leader>ft', ':lua vim.lsp.buf.format(async)<cr>', options)
                map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', options)
                map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', options)
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                .make_client_capabilities())

            local language = { 'ts_ls', 'gopls', 'clangd', 'yamlls', 'lua_ls', 'cssls', 'jdtls' }

            for _, language_server in ipairs(language) do
                require('lspconfig')[language_server].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end
        end
    },
}
