-- * override the configuration of LazyVim plugins
return {
    { "EdenEast/nightfox.nvim" },
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
        "akinsho/bufferline.nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({})
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end
    },
    { 'akinsho/toggleterm.nvim', version = "*", config = true }
}
