-- * override the configuration of LazyVim plugins
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            file_ignore_patterns = { 'node_modules' }
        }
    },
    {
        "akinsho/bufferline.nvim"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "c", "lua", "go", "js" }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim"
        },
        config = function()
            require("mason-lspconfig").setup()
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

            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                .make_client_capabilities())

            local language = { 'ts_ls', 'gopls', 'clangd', 'yamlls', 'lua_ls', 'cssls' }

            for _, language_server in ipairs(language) do
                require('lspconfig')[language_server].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline", "saadparwaiz1/cmp_luasnip", "f3fora/cmp-spell",
            "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji", 'L3MON4D3/LuaSnip'
        },
        config = function()
            local cmp = require 'cmp'

            local nextItemCallback = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end

            local prevItemCallback = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                end
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback) nextItemCallback(fallback) end,
                        { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function() prevItemCallback() end, { "i", "s" }),
                    ['<C-t>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                    },
                    {
                        { name = 'buffer' },
                    }
                )
            })
            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end,
    },
}
