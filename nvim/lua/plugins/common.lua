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
        dependencies = { 'nvim-telescope/telescope-ui-select.nvim' },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { 'node_modules' }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
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
