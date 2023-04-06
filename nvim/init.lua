require('keybindings')
require("mason-lspconfig").setup()
require('plugins')
require('autocmds')
require('sets')
require("bufferline").setup {}
require('configs/lsp_config')
require("luasnip.loaders.from_vscode").lazy_load()
require("transparent").setup({
    extra_groups = {
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
    exclude_groups = {},
})
vim.cmd([[syntax on]])
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
