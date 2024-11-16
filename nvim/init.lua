require("config.lazy")
require("config.keybindings")
require("config.autocmds")
require("config.sets")
--require("luasnip.loaders.from_vscode").lazy_load()
--require("transparent").setup({
--	extra_groups = {
--		"BufferLineTabClose",
--		"BufferlineBufferSelected",
--		"BufferLineFill",
--		"BufferLineBackground",
--		"BufferLineSeparator",
--		"BufferLineIndicatorSelected",
--	},
--	exclude_groups = {},
--})
vim.cmd([[syntax on]])
--vim.opt.background = "dark"
--vim.cmd([[colorscheme gruvbox]])
