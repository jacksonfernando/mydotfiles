require('keybindings')
require('plugins')
require('sets')
require("bufferline").setup {}
require("luasnip.loaders.from_vscode").lazy_load()
require("transparent").setup({
  enable = true,
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {},
})

vim.cmd([[syntax on]])
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
