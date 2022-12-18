require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'vim-test/vim-test'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'tpope/vim-fugitive'
    use 'vim-airline/vim-airline'
    use 'neovim/nvim-lspconfig'
    use 'dart-lang/dart-vim-plugin'
    use 'thosakwe/vim-flutter'
    use "rafamadriz/friendly-snippets"
    use { "ellisonleao/gruvbox.nvim" }
    use 'xiyaowong/nvim-transparent'
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-telescope/telescope.nvim', config = function() require('configs/telescope') end }
    use { 'nvim-treesitter/nvim-treesitter', config = function() require('configs/treesitter') end }
    use { 'williamboman/mason.nvim',
        config = function() require('configs/mason') end,
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        }
    }
    use { 'kyazdani42/nvim-tree.lua', config = function() require('configs/filetree') end }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" }, { "saadparwaiz1/cmp_luasnip" }, { "f3fora/cmp-spell" },
            { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" }, { 'L3MON4D3/LuaSnip' }
        },
        config = function() require('configs/cmp') end
    }
end)
