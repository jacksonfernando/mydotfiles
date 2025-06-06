return {
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
                    { name = 'luasnip' }
                },
                {
                    { name = 'buffer' }
                },
                {
                    { name = "vim-dadbod-completion" }
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

}
