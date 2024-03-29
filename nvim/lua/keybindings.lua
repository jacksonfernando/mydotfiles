local map = vim.api.nvim_set_keymap
map('n', '<Space>', '', {})
vim.g.mapleader = ' '
local options = { noremap = true }
-- nvim tree
map('n', '<leader>te', ':terminal<cr>', options)
map('n', '<leader>ve', ':vertical sb<cr>', options)
map('n', '<leader>pv', ':NvimTreeToggle<cr>', options)
map('n', '<leader>h', ':wincmd h<cr>', options)
map('n', '<leader>j', ':wincmd j<cr>', options)
map('n', '<leader>k', ':wincmd k<cr>', options)
map('n', '<leader>l', ':wincmd l<cr>', options)
map('n', '<leader>=', ':vertical resize +5<cr>', options)
map('n', '<leader>-', ':vertical resize -5<cr>', options)
-- telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fg', ':Telescope live_grep<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)
map('n', '<leader>fh', ':Telescope help_tags<cr>', options)
--vim fugitive
map('n', '<leader>gs', ':G<cr>', options)
map('n', '<leader>gh', ':diffget //2<cr>', options)
map('n', '<leader>gl', ':diffget //3<cr>', options)
-- vim test
map('n', '<leader>t', ':TestNearest<cr>', options)
map('n', '<leader>ta', ':TestFile<cr>', options)
map('n', '<leader>tv', ':TestVisit<cr>', options)
-- bufferline
map('n', '<leader>bc', ':BufferLinePickClose<cr>', options)
map('n', '<leader>bp', ':BufferLinePick<cr>', options)
map('n', '[[', ':BufferLineCycleNext<cr>', options)
map('n', ']]', ':BufferLineCyclePrev<cr>', options)
-- snippets
map('i', "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", options)
map('s', "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", options)
map('s', "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", options)
map('s', "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", options)
