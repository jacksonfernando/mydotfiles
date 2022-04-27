require('keybindings')
require('plugins')
require('sets')
require("bufferline").setup{}

vim.cmd([[syntax on]])
require('onedark').setup({
  transparent = true,
  transparent_sidebar = true
})
