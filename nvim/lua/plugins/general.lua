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
        "akinsho/bufferline.nvim"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
}
